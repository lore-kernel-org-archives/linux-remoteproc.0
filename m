Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJOXViNt"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34680D40
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Nov 2023 11:22:13 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a184d717de1so174219966b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Nov 2023 11:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701372131; x=1701976931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ug5sK0VSfkfpkr6j+TCzQniBNLZqaox3YwajnT5OvU=;
        b=EJOXViNtd6p3eB+uD5eyY794F5yzRT38GW2vdxRZkzcl+J6EIp1+T3RGhFhYyL4yjQ
         LA/mwWec9n/I5fT7DucPsn9Iyfs4YpbnEer/5DeDAXdkWZX6gmW8Ctc3bbFduAyeeou4
         3BJ/DQoo999WUIlbXGj/SSfWC9BDKr8R0vh6oPIIT37rYzSn/OHlPB8Df8g5xk09txyH
         C3Dvq2OiXyU+bpl0Q/3+qPWbjvc3DNCF3TeO1bRVRNkM63AlHXs4cvLjpahc5Bq1ePrq
         dolDDecH4NQooULPBz4NjolwvAj+dFBHjM1mPpaJ/E4JJnaJyiVuyq+PPPvWvw0iGj08
         g79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701372131; x=1701976931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ug5sK0VSfkfpkr6j+TCzQniBNLZqaox3YwajnT5OvU=;
        b=MSa5WWYeEvI+u5Sz9lpM10Kjo1ExlilFP7Pg5I/VrEwZQF+pSGK3NBXpwONnXvqlMD
         NZe/tw21Q8pcND5XExLriA0Fk8npjXkwl1Q6b61Ktq+CeRZ97rHtAxxrxyQcU7u+YuWs
         qPni6PcENjKQwb/9v/SVJReyi7QcNp2i9B+/JOcdB1c/k1xfk0AYLej+I1A9EgCZsfY3
         /DZfLjt3yRLthjPnIaSNcZ3Ksq9uauJ8DQQ1gdQ+0KQDNjCEkceSAm6vvONVIW7B8Yfi
         q0sfGCIOSXshVc/oA4di/FzJDl3LYVA3hKAERVzi6qQppQr7N8I2LYTVz1w0qQdSoa/W
         mmwA==
X-Gm-Message-State: AOJu0YxySoOiuBi8xcUv6hd7Z5CaP9LKtGzXeMDB7XQROqMFq7t6Vuot
	WIQqRhWSBe6FneVb4JJAszj81/u2iZfCz2PzoOkbRQ==
X-Google-Smtp-Source: AGHT+IGn2PXzJNo2gnnr6hR1jcjwaTCA5+gJP7mZ/5M+E3y03ndXfqKXIG1ZqHJG5CRe0RNARoAecmOS5+tulGZbTK0=
X-Received: by 2002:a05:6512:6cf:b0:507:9854:3b95 with SMTP id
 u15-20020a05651206cf00b0050798543b95mr3432lff.14.1701364812985; Thu, 30 Nov
 2023 09:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de> <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 30 Nov 2023 10:19:42 -0700
Message-ID: <CANLsYky5tL6UZADgVBPEnPkN4GMKOhvn95oci7PywSZ2nyNXqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message
 in .remove()
To: Hari Nagalla <hnagalla@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	kernel@pengutronix.de, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hari and Nishanth,

On Thu, 23 Nov 2023 at 14:17, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> When the remove callback returns non-zero, the driver core emits an
> error message about the error value being ignored. As the driver already
> emits an error message already, return zero. This has no effect apart
> from suppressing the core's message. The platform device gets unbound
> irrespective of the return value.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remotepr=
oc/ti_k3_dsp_remoteproc.c
> index ef8415a7cd54..40a5fd8763fa 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_device=
 *pdev)
>         if (rproc->state =3D=3D RPROC_ATTACHED) {
>                 ret =3D rproc_detach(rproc);
>                 if (ret) {
> +                       /* Note this error path leaks resources */
>                         dev_err(dev, "failed to detach proc, ret =3D %d\n=
", ret);
> -                       return ret;
> +                       return 0;

Please have a look at this error path.  As with the scenario where the
remote processor is controlled by the remoteproc core, nothing can be
done in .remove() to prevent the driver from going away.  As such and
even if rproc_detach() fails, other resources associated with this
remote processor should be cleaned-up.

Thanks,
Mathieu

>                 }
>         }
>
> --
> 2.42.0
>
