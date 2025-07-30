# ----------------------------------------
# LaTeXmk Configuration File (latexmkrc)
# ----------------------------------------
# Modular, error-checked, and organized configuration for LaTeXmk.
# Features:
#   - LuaLaTeX as default engine
#   - Custom output/auxiliary directories
#   - Automatic cleanup of intermediate files
#   - Bibliography management using biber
#   - Glossary and index handling with warnings if tools are missing
#   - Knitr, feynmf, feynmp, asymptote, metapost, and chktex integration
#   - PDF post-processing with qpdf and warning if not found
#   - OS-specific PDF viewer commands
# ----------------------------------------

# ========== BASIC SETTINGS ==========
$pdflatex        = 'lualatex --shell-escape --synctex=1 --interaction=nonstopmode %O %S';
$pdf_previewer   = 'open -a Preview "%S"';
$pdf_mode        = 1;
$silent          = 1;
$cleanup_mode    = 1;
$postscript_mode = $dvi_mode = 0;
$go_mode         = 3;
$bibtex_use      = 2;

# ========== CLEANUP CONFIGURATION ==========
$clean_ext = join(
    ' ',
    "%R-blx.bib", qw(
        4ct 4tc acn acr alg aux auxlock backup bak bbl bcf bit blg brf cb cb2 def dep dll drv dvi enc exe
        fdb_latexmk fls fmt fot glg glo gls glsdefs glx gnuplot gxg gxs gz htf idv idx ilg ind ini ist lg
        loa lof log lot ltx md5 mkii mkiv mkvi mp mpx nav out pag pdf pdfxref pictex plt prv ptc run run.xml
        save slg slo sls snm svn swp synctex(busy) synctex.gz tmp toc tui tyi upa upb url vrb xdv xdy xml
    )
);

# ========== UTILITY SUBROUTINES ==========

sub warn_if_missing {

    # Warn if a required program is missing from the PATH.
    # Args:
    #   $prog: Program name
    #   $desc: Description for warning
    my ( $prog, $desc ) = @_;
    my $found = 0;
    foreach my $dir ( split( /:/, $ENV{PATH} ) ) {
        if ( -x "$dir/$prog" ) { $found = 1; last; }
    }
    warn "Warning: $desc ($prog) not found in PATH!\n" unless $found;
}

# ========== GLOSSARIES ==========

add_cus_dep( 'glo', 'gls', 0, 'glo2gls' );
add_cus_dep( 'acn', 'acr', 0, 'glo2gls' );

sub glo2gls {

    # Build glossaries using makeglossaries.
    # Args:
    #   $_[0]: Base filename
    warn_if_missing( 'makeglossaries', 'Glossaries tool' );
    system("makeglossaries $_[0]");
}

# ========== MAKEINDEX ==========

@ist = glob("ist");
if ( scalar(@ist) > 0 ) {
    warn_if_missing( 'makeindex', 'Index tool' );
    $makeindex = "makeindex -s $ist[0] %O -o %D %S";
}
else {
    warn_if_missing( 'makeindex', 'Index tool' );
}

# ========== NOMENCLATURE ==========

add_cus_dep( 'nlo', 'nls', 0, 'nlo2nls' );

sub nlo2nls {

    # Build nomenclature using makeindex and nomencl.ist.
    # Args:
    #   $_[0]: Base filename
    warn_if_missing( 'makeindex', 'Nomenclature (makeindex)' );
    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}

# ========== KNITR ==========

use File::Basename;
my $root_file = $ARGV[-1];

add_cus_dep( 'Rtex', 'tex', 0, 'rtex_to_tex' );

sub rtex_to_tex {

    # Convert .Rtex to .tex using knitr.
    # Args:
    #   $_[0]: Base filename (without extension)
    do_knitr("$_[0].Rtex");
}

sub do_knitr {

    # Run knitr on the given Rtex file.
    # Args:
    #   $_[0]: Full path to .Rtex file
    my $dirname  = dirname( $_[0] );
    my $basename = basename( $_[0] );
    warn_if_missing( 'Rscript', 'Knitr (Rscript)' );
    system("Rscript -e \"library('knitr'); setwd('$dirname'); knit('$basename')\"");
}

my $rtex_file = $root_file =~ s/\.tex$/.Rtex/r;
unless ( -e $root_file ) {
    if ( -e $rtex_file ) {
        do_knitr($rtex_file);
    }
}

# ========== FEYNMF ==========

push( @file_not_found, '^feynmf: Files .* and (.*) not found:$' );
add_cus_dep( 'mf', 'tfm', 0, 'mf_to_tfm' );

sub mf_to_tfm {

    # Generate TFM files from MF files for feynmf.
    # Args:
    #   $_[0]: Base filename
    warn_if_missing( 'mf', 'Metafont (feynmf)' );
    system("mf '\\mode:=laserjet; input $_[0]'");
}

# ========== FEYNMP ==========

push( @file_not_found, '^dvipdf: Could not find figure file (.*); continuing.$' );
add_cus_dep( 'mp', '1', 0, 'mp_to_eps' );

sub mp_to_eps {

    # Generate EPS from MP files for feynmp.
    # Args:
    #   $_[0]: Base filename
    warn_if_missing( 'mpost', 'MetaPost (feynmp)' );
    system("mpost $_[0]");
    return 0;
}

# ========== ASYMPTOTE ==========

sub asy {

    # Run Asymptote on the given file.
    # Args:
    #   $_[0]: Base filename
    warn_if_missing( 'asy', 'Asymptote' );
    return system("asy --offscreen '$_[0]'");
}
add_cus_dep( 'asy', 'eps', 0, 'asy' );
add_cus_dep( 'asy', 'pdf', 0, 'asy' );
add_cus_dep( 'asy', 'tex', 0, 'asy' );

# ========== METAPOST ==========

add_cus_dep( 'mp', '1', 0, 'mpost' );

sub mpost {

    # Run MetaPost on the given file.
    # Args:
    #   $_[0]: Full path to .mp file
    my $file = $_[0];
    my ( $name, $path ) = fileparse($file);
    warn_if_missing( 'mpost', 'MetaPost' );
    pushd($path);
    my $return = system("mpost $name");
    popd();
    return $return;
}

# ========== CHKTEX ==========

sub run_chktex {

    # Run ChkTeX on the main .tex file if CHKTEX_OPTIONS is set.
    # Exits with error if CHKTEX_EXIT_ON_ERROR or CHKTEX_VALIDATE is set and errors are found.
    unlink 'output.chktex' if -f 'output.chktex';
    return unless defined $ENV{'CHKTEX_OPTIONS'};
    use File::Basename;
    use Cwd;
    my $target = $ARGV[-1];
    my $file   = basename($target);
    if ( $file =~ /\.tex$/ ) {
        my $orig_dir = cwd();
        my $subdir   = dirname($target);
        chdir($subdir);
        warn_if_missing( 'chktex', 'ChkTeX' );
        my $status = system( "/usr/bin/run-chktex.sh", $orig_dir, $file );
        chdir($orig_dir);
        if ( $ENV{'CHKTEX_EXIT_ON_ERROR'} || $ENV{'CHKTEX_VALIDATE'} ) {
            open( my $fh, '<', 'output.chktex' );
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
run_chktex();

# ========== PDF POST-PROCESSING ==========

$compiling_cmd = "internal latexpdf_pre_process %T %D";
$success_cmd   = "internal latexpdf_post_process %T %D";
$failure_cmd   = $success_cmd;

my $ORIG_PDF_AGE;

sub latexpdf_pre_process {

    # Store the modification age of the output PDF before compilation.
    # Args:
    #   $source_file: Source .tex file
    #   $output_file: Output .pdf file
    my ( $source_file, $output_file ) = @_;
    $ORIG_PDF_AGE = -M $output_file;
}

sub latexpdf_post_process {

    # Post-process the PDF after compilation.
    # - Patch synctex for knitr if needed.
    # - Optimize PDF with qpdf if available.
    # Args:
    #   $source_file: Source .tex file
    #   $output_file: Output .pdf file
    my ( $source_file, $output_file ) = @_;
    my $source_without_ext = $source_file =~ s/\.tex$//r;
    my $output_without_ext = $output_file =~ s/\.pdf$//r;

    my $concordance_file = "${source_without_ext}-concordance.tex";
    if ( -e $concordance_file ) {
        print "Patching synctex file for knitr...\n";
        warn_if_missing( 'Rscript', 'patchSynctex.R' );
        system( "patchSynctex.R", $source_without_ext, $output_without_ext );
    }

    my $NEW_PDF_AGE = -M $output_file;
    return if !defined($NEW_PDF_AGE);
    return if defined($ORIG_PDF_AGE) && $NEW_PDF_AGE == $ORIG_PDF_AGE;

    $qpdf //= "/usr/bin/qpdf";
    $qpdf = $ENV{QPDF} if defined( $ENV{QPDF} ) && -x $ENV{QPDF};
    unless ( -x $qpdf ) {
        warn "Warning: qpdf not found for PDF optimization!\n";
        return;
    }

    $qpdf_opts //= "--linearize --newline-before-endstream";
    $qpdf_opts = $ENV{QPDF_OPTS} if defined( $ENV{QPDF_OPTS} );

    my $optimised_file = "${output_file}.opt";
    system( $qpdf, split( ' ', $qpdf_opts ), $output_file, $optimised_file );
    my $qpdf_exit_code = ( $? >> 8 );
    return if !( $qpdf_exit_code == 0 || $qpdf_exit_code == 3 );

    rename( $optimised_file, $output_file );

    my $xref_file = "${output_file}xref";
    system("$qpdf --show-xref ${output_file} > ${xref_file}");
}

# ========== END OF CONFIGURATION ==========
