# ----------------------------------------
# LaTeXmk Configuration File (latexmkrc)
# ----------------------------------------
# This configuration file is designed for use with LaTeXmk, a powerful tool 
# for managing the LaTeX build process. It specifies commands, directories, 
# cleanup configurations, and other options to streamline the LaTeX compilation workflow.
# 
# Features:
# - LuaLaTeX as the default engine
# - Custom output and auxiliary directories
# - Automatic cleanup of intermediate files
# - Bibliography management using biber
# - Continuous preview mode for live updates
# - Glossary and index handling
# - OS-specific PDF viewer commands
# ----------------------------------------

$pdflatex = 'lualatex --shell-escape --synctex=1 --interaction=nonstopmode %O %S';
$pdf_previewer = 'open -a Preview "%S"';
$pdf_mode = 1;
$silent = 1;
$cleanup_mode = 1;
$postscript_mode = $dvi_mode = 0;
$go_mode = 3;
$bibtex_use = 2;

# ----------------------------------------
# Cleanup Configuration
# ----------------------------------------

# Specify extensions and files to clean up after compilation
$clean_ext = "%R-blx.bib 4ct 4tc acn acr alg aux auxlock backup bak bbl bcf bit blg brf cb cb2 def dep dll drv dvi enc exe fdb_latexmk fls fmt fot glg glo gls glsdefs glx gnuplot gxg gxs gz htf idv idx ilg ind ini ist lg loa lof log lot ltx md5 mkii mkiv mkvi mp mpx nav out pag pdf pdfxref pictex plt prv ptc run run.xml save slg slo sls snm svn swp synctex(busy) synctex.gz tmp toc tui tyi upa upb url vrb xdv xdy xml";

# ----------------------------------------
# Glossaries
# ----------------------------------------
add_cus_dep('glo', 'gls', 0, 'glo2gls');
add_cus_dep('acn', 'acr', 0, 'glo2gls');
sub glo2gls {
    system("makeglossaries $_[0]");
}

# ----------------------------------------
# makeindex
# ----------------------------------------
@ist = glob("ist");
if (scalar(@ist) > 0) {
    $makeindex = "makeindex -s $ist[0] %O -o %D %S";
}

# ----------------------------------------
# nomenclature
# ----------------------------------------
add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}

# ----------------------------------------
# Knitr
# ----------------------------------------
my $root_file = $ARGV[-1];
add_cus_dep('Rtex', 'tex', 0, 'rtex_to_tex');
sub rtex_to_tex {
    do_knitr("$_[0].Rtex");
}
sub do_knitr {
    my $dirname = dirname($_[0]);
    my $basename = basename($_[0]);
    system("Rscript -e \"library('knitr'); setwd('$dirname'); knit('$basename')\"");
}
my $rtex_file = $root_file =~ s/\.tex$/.Rtex/r;
unless (-e $root_file) {
    if (-e $rtex_file) {
        do_knitr($rtex_file);
    }
}

# ----------------------------------------
# feynmf
# ----------------------------------------
push(@file_not_found, '^feynmf: Files .* and (.*) not found:$');
add_cus_dep('mf', 'tfm', 0, 'mf_to_tfm');
sub mf_to_tfm {
    system("mf '\\mode:=laserjet; input $_[0]'");
}

# ----------------------------------------
# feynmp
# ----------------------------------------
push(@file_not_found, '^dvipdf: Could not find figure file (.*); continuing.$');
add_cus_dep('mp', '1', 0, 'mp_to_eps');
sub mp_to_eps {
    system("mpost $_[0]");
    return 0;
}

# ----------------------------------------
# asymptote
# ----------------------------------------
sub asy {
    return system("asy --offscreen '$_[0]'");
}
add_cus_dep('asy', 'eps', 0, 'asy');
add_cus_dep('asy', 'pdf', 0, 'asy');
add_cus_dep('asy', 'tex', 0, 'asy');

# ----------------------------------------
# metapost
# ----------------------------------------
add_cus_dep('mp', '1', 0, 'mpost');
sub mpost {
    my $file = $_[0];
    my ($name, $path) = fileparse($file);
    pushd($path);
    my $return = system("mpost $name");
    popd();
    return $return;
}

# ----------------------------------------
# chktex
# ----------------------------------------
unlink 'output.chktex' if -f 'output.chktex';
if (defined $ENV{'CHKTEX_OPTIONS'}) {
    use File::Basename;
    use Cwd;

    my $target = $ARGV[-1];
    my $file = basename($target);

    if ($file =~ /\.tex$/) {
        my $orig_dir = cwd();
        my $subdir = dirname($target);
        chdir($subdir);

        $status = system(
            "/usr/bin/run-chktex.sh",
            $orig_dir,
            $file
        );

        chdir($orig_dir);

        if ($ENV{'CHKTEX_EXIT_ON_ERROR'} || $ENV{'CHKTEX_VALIDATE'}) {
            open(my $fh, '<', 'output.chktex');
            my $errors = 0;
            while (<$fh>) {
                if (/^\S+:\d+:\d+: Error:/) {
                    $errors++;
                    print;
                }
            }
            close($fh);
            exit(1) if $errors > 0;
            exit(0) if $ENV{'CHKTEX_VALIDATE'};
        }
    }
}

# ----------------------------------------
# Post processing of pdf file
# ----------------------------------------

$compiling_cmd = "internal latexpdf_pre_process %T %D";
$success_cmd = "internal latexpdf_post_process %T %D";
$failure_cmd = $success_cmd;

my $ORIG_PDF_AGE;

sub latexpdf_pre_process {
    my ($source_file, $output_file) = @_;
    $ORIG_PDF_AGE = -M $output_file;
}

sub latexpdf_post_process {
    my ($source_file, $output_file) = @_;
    my $source_without_ext = $source_file =~ s/\.tex$//r;
    my $output_without_ext = $output_file =~ s/\.pdf$//r;

    my $concordance_file = "${source_without_ext}-concordance.tex";
    if (-e $concordance_file) {
        print "Patching synctex file for knitr...\n";
        system("patchSynctex.R", $source_without_ext, $output_without_ext);
    }

    my $NEW_PDF_AGE = -M $output_file;
    return if !defined($NEW_PDF_AGE);
    return if defined($ORIG_PDF_AGE) && $NEW_PDF_AGE == $ORIG_PDF_AGE;

    $qpdf //= "/usr/bin/qpdf";
    $qpdf = $ENV{QPDF} if defined($ENV{QPDF}) && -x $ENV{QPDF};
    return if !-x $qpdf;

    $qpdf_opts //= "--linearize --newline-before-endstream";
    $qpdf_opts = $ENV{QPDF_OPTS} if defined($ENV{QPDF_OPTS});

    my $optimised_file = "${output_file}.opt";
    system($qpdf, split(' ', $qpdf_opts), $output_file, $optimised_file);
    my $qpdf_exit_code = ($? >> 8);
    return if !($qpdf_exit_code == 0 || $qpdf_exit_code == 3);

    rename($optimised_file, $output_file);

    my $xref_file = "${output_file}xref";
    system("$qpdf --show-xref ${output_file} > ${xref_file}");
}
