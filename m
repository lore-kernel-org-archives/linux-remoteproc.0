Return-Path: <jrdr.linux@gmail.com>
MIME-Version: 1.0
References: <20190109142959.GA29659@hp-pavilion-15-notebook-pc-brajeswar>
In-Reply-To: <20190109142959.GA29659@hp-pavilion-15-notebook-pc-brajeswar>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 15 Jan 2019 11:17:25 +0530
Message-ID: <CAFqt6zbXzpvRS-aO7_s21k+vzzmQwOayZzJqw8c85fUPuq=soQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/qcom_sysmon.c: Remove duplicate header
Content-Type: text/plain; charset="UTF-8"
To: Brajeswar Ghosh <brajeswar.linux@gmail.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Jan 9, 2019 at 8:00 PM Brajeswar Ghosh
<brajeswar.linux@gmail.com> wrote:
>
> Remove linux/notifier.h which is included more than once
>
> Signed-off-by: Brajeswar Ghosh <brajeswar.linux@gmail.com>

Acked-by: Souptick Joarder <jrdr.linux@gmail.com>

> ---
>  drivers/remoteproc/qcom_sysmon.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index e976a602b015..603b813151f2 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -7,7 +7,6 @@
>  #include <linux/notifier.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> -#include <linux/notifier.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc/qcom_rproc.h>
> --
> 2.17.1
>
