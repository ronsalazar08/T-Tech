import os
from django.contrib import admin
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'kgb@sk=_wv-47etv3l+n+gv%t*qi_+by)wd6oebg%e_kems6u@'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['127.0.0.1', 'localhost', '10.44.2.161']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'admin_reorder',
    'crispy_forms',
    'widget_tweaks',
    'T_Tech',
    'office',
    'contractor',
    'creform',
    'fabrication',
    'rbf',
    'hr',
    'iboard',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'admin_reorder.middleware.ModelAdminReorder',
]

ROOT_URLCONF = 'T_Tech.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'T_Tech.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'TorresTech',
        'USER': 'root',
        'PASSWORD': '0000',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
            'sql_mode': 'traditional',
        }
    }
}


# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Manila'

USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

CRISPY_TEMPLATE_PACK = 'bootstrap4'

LOGIN_REDIRECT_URL = '/dashboard/'
LOGIN_URL = 'login'
LOGOUT_REDIRECT_URL = 'login'

ADMIN_REORDER = (
    # Keep original label and models
    'auth',

    # Rename app
    {'app': 'office', 'label': 'Office',
        'models': ('office.employee',
                    # 'office.january',
                    # 'office.february',
                    # 'office.march',
                    # 'office.april',
                    # 'office.may',
                    # 'office.june',
                    # 'office.july',
                    # 'office.august',
                    # 'office.september',
                    # 'office.october',
                    # 'office.november',
                    # 'office.december',
                    )},
    # 'crimping_dies',
    'creform',
    'fabrication',
    'rbf',
    'hr',
    {'app': 'office', 'label': 'Month (OFFICE)',
        'models': ('office.january',
                    'office.february',
                    'office.march',
                    'office.april',
                    'office.may',
                    'office.june',
                    'office.july',
                    'office.august',
                    'office.september',
                    'office.october',
                    'office.november',
                    'office.december',
        )},
    {'app': 'contractor', 'label': 'Contractor',
        'models': ('contractor.employee',
                    'contractor.logbox',
                    'contractor.CurWeek',
                    'contractor.CurWeekNS',
                    'contractor.LasWeek',
                    'contractor.LasWeekNS',
                    'contractor.ComputationTemplateRegular',
                    'contractor.ComputationTemplateNonRegular',)},
    {'app': 'contractor', 'label': 'Month (Contractor)',
        'models': ('contractor.january',
                    'contractor.february',
                    'contractor.march',
                    'contractor.april',
                    'contractor.may',
                    'contractor.june',
                    'contractor.july',
                    'contractor.august',
                    'contractor.september',
                    'contractor.october',
                    'contractor.november',
                    'contractor.december',
        )},
)
