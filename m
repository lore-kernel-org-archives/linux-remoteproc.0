Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A083285C98
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839110; cv=none; b=JxNdi85SR+uoGFa2uJ9W+C1F1vss0WupbPqEjI0r1cWUeRgZgsHFAFTzX/PD+4nqycda83oe25sBRedPeUJMKRhN1K+HvmQKbsSiW/tMTEzh3o5Gnsu6JXvE4ELFJUwDvI4TiahZyIfI2qtfcKA0KPBg2JQf27KgTnvAiM8Wl7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839110; c=relaxed/simple;
	bh=4wdI/kWWVfqayanlY8MhgqBGSqVwUCmL94mPJ7ck8EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxd0493E9NLGLfs0o4JAN9JHQQ7q72aGXqB9HYqcOUPl7bVVLbu+KrmTsPCTL5bxrJcrWnOJpfRyzvf57ib1QiB+JdRxodIr7s9iiDAqREuhh7TdKEYAQy75JguOMp1pkHeREOeqZxW8EPQBRyt63gOjInoI06hIO8TZ7BBzCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L5EIOyV2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L5EIOyV2"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36295d53a10so10194841fa.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761839106; x=1762443906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6akgDw0rUZ91b2lrMYaxRTJHPHTR7/7d9qqAaAZpCEw=;
        b=L5EIOyV2O9iKAcTFeU8JdGORs6SNnaiAFu4faQyI/3n3kaOEXuXlRX3QCgedikG3VI
         M1hcq3sz3+inpWuHpASilfHnCiM2WDklSDOaqzLp6X88iY4DVSrC56HVtXxBNqbylW0F
         xOK08S+/JW0tHnfDEurQhR7ER7Q28SA+AT4Lxfz5Dj5a9jBPPCQhch8H9GXzwGOVaFAG
         IAIv+H7D1eVq2S5L6dpsepUZJV6Sg+UvfJ66Gk3v2sUsPcaPXrxJKwlDFyHHBh6LRTre
         hYgd9X+nAlLoVosQlYl5hDBURoFexqAyAODx4jKSjf1lZ+Zh1nson2WLpQSrGTBHaLxi
         vKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761839106; x=1762443906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6akgDw0rUZ91b2lrMYaxRTJHPHTR7/7d9qqAaAZpCEw=;
        b=lzFuxW5oIbDqnLHxRAvul0wcs4F1J5tgGhPo7QVU9T0EEAp1X9Ib1+oHlHX2DXAySA
         ZrJx36Pk3Q6lI985pbNyW48CfOZVIV+S52gjEmmQJniHZRXzqU04cmnCoOd5e2526M9k
         BNWKQxaLjPQf1eqEIaD6d6gGWTntZ8SOd9zlrs59308VL5NEEzicwWBo+xn3aJDu2E13
         rmbmcep6zvHCWtmmD6gAYLzg7/P9HlZHQKiDDTNe26E3VSkCKWWzpbof8tspQifbiJD+
         zQ2TsKB7v7vMdI4ZSVGTnwnsvPLSQS/8366beeoT9zJ3hb99fhTZ55sHFaztUJJ842Bo
         rv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGiYITfjyFGnLaVIWV8SIzvieZQadsgIE5TYUBkrFukN93AfnV8B0LkQ3WgQ87kqDp3GrKSbZ1rkyGw28be0UT@vger.kernel.org
X-Gm-Message-State: AOJu0YzREQR0IwU5v3Z0UY828tVIgOhlPnOz3Qc59tLORU0eKKhrTk6J
	mWs5ewAHXvx7fUgdEw9HN4gXCxXqrOGaNKR4U0XXcvyNvBPs2+SKhie6SBIWXFTUP/FIv3WilEd
	NlaYLhGJ8lwzqJr+zg7BQxuHaD/Tw+fHcXZ8o2wI5Ng==
X-Gm-Gg: ASbGncv7nJNKfxXgufW9YNnJrgjh1f0ZP8q14i18NsnxxwP030WyT5goKPHeb0zlm//
	IxCINUo9GWG3/kZZxxRD0TCjVeiIDQkktfWgJWXM4C3bNd7abBq78WdghzptPyFW+AkTYp909ve
	K1ATEHJoHRawwUPqlE0QobFgvL3tNSo7vJNyYB6/56slaj0rjcZBswSPHhDuwlZj0w6ySYiOXhW
	pG4OqsILFflL8jYtmryR6XMrrYWF/XK1MnsJyXkrDtZUTNRGc547dLvDXRWZxOlrGi2V+5q0aJ1
	5AcSWBvAgRz3BRGiGkftaDWvvtXtgPbYKLH0
X-Google-Smtp-Source: AGHT+IG9DOL9q1v7PPKQQMl6FrbUdYwOVLW19Hk65lHsAqZGusbK2QYhJ0Pdixkxw3U1XGLanb9R8lxY//92OR2J93k=
X-Received: by 2002:a05:651c:25d1:20b0:376:533f:e15a with SMTP id
 38308e7fff4ca-37a18e7596bmr831601fa.48.1761839106061; Thu, 30 Oct 2025
 08:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029195619.152869-1-shenwei.wang@nxp.com> <20251029195619.152869-5-shenwei.wang@nxp.com>
In-Reply-To: <20251029195619.152869-5-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Oct 2025 16:44:52 +0100
X-Gm-Features: AWmQ_blSmI92ElztzCrUwjPlKqESQNc6fO4hMknU1QrcXqAqhR50Y93g9AsOVGA
Message-ID: <CAMRc=MfugHWP=t83+ki5LaSkyX8=STn2FV=+x6msxD++ogLSyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:57=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> On i.MX SoCs, the system may include two processors:
>         - An MCU running an RTOS
>         - An MPU running Linux
>
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
>

Looks good, just a couple nits.

> +
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/imx_rpmsg.h>

Also at least: mutex.h, completion.h, device.h (for devm_kzalloc() and
co.), module.h, mod_devicetable.h.

> +
> +static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
> +{
> +       struct imx_rpmsg_driver_data *pltdata =3D pdev->dev.platform_data=
;
> +       struct imx_rpmsg_gpio_port *port;
> +       struct gpio_irq_chip *girq;
> +       struct gpio_chip *gc;
> +       int ret;
> +
> +       if (!pltdata)
> +               return -EPROBE_DEFER;
> +
> +       port =3D devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +       if (!port)
> +               return -ENOMEM;
> +
> +       ret =3D device_property_read_u32(&pdev->dev, "reg", &port->idx);
> +       if (ret)
> +               return ret;
> +
> +       if (port->idx > MAX_DEV_PER_CHANNEL)
> +               return -EINVAL;
> +
> +       mutex_init(&port->info.lock);

devm_mutex_init() to allow mutex debugging

> +
> +static struct platform_driver imx_rpmsg_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "gpio-imx-rpmsg",
> +               .of_match_table =3D imx_rpmsg_gpio_dt_ids,
> +       },
> +       .probe =3D imx_rpmsg_gpio_probe,
> +};
> +
> +module_platform_driver(imx_rpmsg_gpio_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor");

You can state copyright for a company in the header comment, please
put your name and email address in here.

> +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

With the above fixed:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
