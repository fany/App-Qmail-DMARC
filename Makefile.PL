use 5.014;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'App::Qmail::DMARC',
    AUTHOR             => q{Martin Sluka <fany@cpan.org>},
    VERSION_FROM       => 'lib/App/Qmail/DMARC.pm',
    LICENSE            => 'artistic_2',
    EXE_FILES          => ['bin/qmail-dmarc'],
    PL_FILES           => {},
    MIN_PERL_VERSION   => '5.014',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        'Mail::Qmail::Filter' => 1,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'App-Qmail-DMARC-*' },

    PERM_DIR => '755',

    META_MERGE => {
        resources => {
            homepage   => 'https://github.com/fany/App-Qmail-DMARC',
            repository => 'https://github.com/fany/App-Qmail-DMARC.git',
        },
        x_deprecated => 1,
    },
);
