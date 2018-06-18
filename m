Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <1528822711-13342-1-git-send-email-loic.poulain@linaro.org>
References: <1528822711-13342-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <152934065755.16708.15962299104686595599@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] remoteproc: wcnss: Wait for iris before starting
Date: Mon, 18 Jun 2018 09:50:57 -0700
To: Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Loic Poulain (2018-06-12 09:58:31)
> wcnss_start fails when called by remoteproc before iris probing.

Please add () to functions so we know they're functions and not
variables or something else.

> Fix this by adding synchronization/completion on iris assignment.
> =

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> =

> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wc=
nss.c
> index b0e07e9..e5fbf91 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -86,6 +86,7 @@ struct qcom_wcnss {
>  =

>         struct mutex iris_lock;
>         struct qcom_iris *iris;
> +       struct completion iris_assigned;
>  =

>         struct regulator_bulk_data *vregs;
>         size_t num_vregs;
> @@ -146,6 +147,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
>  =

>         wcnss->iris =3D iris;
>         wcnss->use_48mhz_xo =3D use_48mhz_xo;
> +       complete(&wcnss->iris_assigned);
>  =

>         mutex_unlock(&wcnss->iris_lock);

Do you need this mutex anymore then? It looks like assign and start are
synchronized with the completion variable now.
