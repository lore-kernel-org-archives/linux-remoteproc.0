Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309343DA26
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135574; cv=none; b=rq0czLps1OpPT1vFrdMdjsy2bbaDUZYoBm3J8Q5SX4LJaU1lr7vzN7EIXfVI0XrT/aNHMpd4TvFNYUNmP+SREoxew8BgcXGEPLNNxzsnyNxmSy90h/oFHWXVu+a4LbdLiG3C/aEithDU3YS+4YxGrl9TP88YVZMqlCMZJgRdhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135574; c=relaxed/simple;
	bh=0NvNqkbHvopZkhx6T/+IIZIFE+ZXvBvs4x160lciOgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAkMH5I8fPuBnHE++zoEkuOYUucLcPHNwRT+cwfQUy2fL/3SSgt0EO2RFxIIw3YQUDJI2V1Kpipd84ceGHkSPvyMTzEQWdKvpniGJnFWMsOFvM4Kt5Rt9pFH+VNOGF6V/oiHIl8R2h1udInY8aMjOQOcX9KfRHsW7i+82Q6hkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2KpT2PX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2KpT2PX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DB7C2BCB1
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135574;
	bh=0NvNqkbHvopZkhx6T/+IIZIFE+ZXvBvs4x160lciOgk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=H2KpT2PXchY67iKw4BU6/Yl1d5CyFTJydVwdKiWhENgeBM56oCA722NqgJC/ZRPIG
	 mcX0jIQIx1kcMLR4OAZYfqOZhUuRE8gNRiDITuGd8390h+DBEOY3DKTZeZoT8Lj5ar
	 nVvSqlDVfImNkLRJWGOl6ukW7wHz2UZOTRMp7uhj+htw+N2CB3c65aiGg5qW6tW9sy
	 Ak9PlF6y3l0DaC1BlEqnIrD7tMN1F9ugJ8VYbpYFwJJtAT8OcQG0kIoU52TdKendeA
	 R5pbTOaQ167IykMHzzTJNVBSeraixqXTaF2fxtNnL3Y4GzbNRkW+CgoOijPvyqjJBh
	 GecNHMqtZ/Omw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a13d6a2d7bso3484045e87.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 02:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8B6yc5S3VNGbhnCl2RdFJU+GeLB/0hyEy1bP2YRC2Y+VxLoBqjxgO+nkRXCS12jGUI93ZoUvLRMVxUpCsdKja@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NnmjHGhy1JABFCH9kDP2oUjmUe3tnBaFK7ZnQZg6EopII00I
	rx0Q57zI9uz0snlAfqAPLTJHA3mdVp00SbJ5fUadaQ71MoOEDE16Ak8bVo6YV0l/hX8vN3PvCHo
	y8ec18RrscdZ0Nzn/VPbhuj6LVilZUWI=
X-Received: by 2002:a05:651c:20ce:10b0:38a:3660:7feb with SMTP id
 38308e7fff4ca-38a5d010b86mr7646831fa.9.1773135572499; Tue, 10 Mar 2026
 02:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:39:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
X-Gm-Features: AaiRm504Z-6QWp77ZJMLsW12D2p9SNHT7rtRZg5o6Wu6DQVg4_G6syeE7d95ZJ4
Message-ID: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:56=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/s=
un6i_hwspinlock.c
> index a0c76bba3f05..c3db81cb1793 100644
> --- a/drivers/hwspinlock/sun6i_hwspinlock.c
> +++ b/drivers/hwspinlock/sun6i_hwspinlock.c
> @@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock =
*lock)
>         writel(SPINLOCK_NOTTAKEN, lock_addr);
>  }
>
> +static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
> +{
> +       return init_data + sizeof(u32) * local_id;
> +}
> +
>  static const struct hwspinlock_ops sun6i_hwspinlock_ops =3D {
>         .trylock        =3D sun6i_hwspinlock_trylock,
>         .unlock         =3D sun6i_hwspinlock_unlock,
> +       .init_priv      =3D sun6i_hwspinlock_init_priv,
>  };
>
>  static void sun6i_hwspinlock_disable(void *data)
> @@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
>  static int sun6i_hwspinlock_probe(struct platform_device *pdev)
>  {
>         struct sun6i_hwspinlock_data *priv;
> -       struct hwspinlock *hwlock;
>         void __iomem *io_base;
>         u32 num_banks;
> -       int err, i;
> +       int err;
>
>         io_base =3D devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID=
);
>         if (IS_ERR(io_base))
> @@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_de=
vice *pdev)
>                 goto bank_fail;
>         }
>
> -       for (i =3D 0; i < priv->nlocks; ++i) {
> -               hwlock =3D &priv->bank->lock[i];
> -               hwlock->priv =3D io_base + SPINLOCK_LOCK_REGN + sizeof(u3=
2) * i;
> -       }
> -
>         /* failure of debugfs is considered non-fatal */
>         sun6i_hwspinlock_debugfs_init(priv);
>         if (IS_ERR(priv->debugfs))
> @@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_de=
vice *pdev)
>                 goto bank_fail;
>         }
>
> -       platform_set_drvdata(pdev, priv);
> -
>         return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_h=
wspinlock_ops,
> -                                        SPINLOCK_BASE_ID, priv->nlocks, =
NULL);
> +                                        SPINLOCK_BASE_ID, priv->nlocks, =
io_base + SPINLOCK_LOCK_REGN);
>
>  bank_fail:
>         clk_disable_unprepare(priv->ahb_clk);

Just a note, I see further code savings in using the clk and reset devm_
helpers. I'll do this after this series is merged, as the context overlaps.


ChenYu
