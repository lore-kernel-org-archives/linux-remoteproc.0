Return-Path: <benjamin.gaignard@linaro.org>
MIME-Version: 1.0
References: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 8 Mar 2019 13:42:44 +0100
Message-ID: <CA+M3ks6r_OWvit3OK0yqDDgfnVyyxPoo5aO2n9tRhhoS4=u4XQ@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock: stm32: implement the relax() ops
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Le jeu. 7 mars 2019 =C3=A0 16:42, Fabien Dessenne <fabien.dessenne@st.com> =
a =C3=A9crit :
>
> Implement this optional ops, called by hwspinlock core while spinning on
> a lock, between two successive invocations of trylock().
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>

> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/s=
tm32_hwspinlock.c
> index 4418392..c8eacf4 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -42,9 +43,15 @@ static void stm32_hwspinlock_unlock(struct hwspinlock =
*lock)
>         writel(STM32_MUTEX_COREID, lock_addr);
>  }
>
> +static void stm32_hwspinlock_relax(struct hwspinlock *lock)
> +{
> +       ndelay(50);
> +}
> +
>  static const struct hwspinlock_ops stm32_hwspinlock_ops =3D {
>         .trylock        =3D stm32_hwspinlock_trylock,
>         .unlock         =3D stm32_hwspinlock_unlock,
> +       .relax          =3D stm32_hwspinlock_relax,
>  };
>
>  static int stm32_hwspinlock_probe(struct platform_device *pdev)
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
