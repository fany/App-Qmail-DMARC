use 5.014;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'Mail::Qmail::DMARC',
    AUTHOR             => q{Martin H. Sluka <fany@cpan.org>},
    VERSION_FROM       => 'lib/Mail/Qmail/DMARC/Queue/Message.pm',
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
        'Mail::Address'               => 0,
        'Mail::DKIM::Verifier'        => 0,
        'Mail::DMARC::PurePerl'       => 0,
        'Mail::Header'                => 0,
        'Mail::Qmail::Queue::Message' => 0,
        'Mail::SPF::Query'            => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Mail-Qmail-DMARC-*' },

    PERM_DIR => '755',

    META_MERGE => {
        resources => {
            homepage   => 'https://github.com/fany/Mail-Qmail-DMARC',
            repository => {
                type => 'git',
                url  => 'https://github.com/fany/Mail-Qmail-DMARC.git',
                web  => 'https://github.com/fany/Mail-Qmail-DMARC',
            },
        },
    },
);
