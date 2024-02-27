Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879E138493
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Feb 2024 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033748; cv=none; b=bvQRQcbU1Ga9u/IJIM1EWY5SB+A6IdXBPO7fnv4rHY9lRHlc9gHfPWk70U6dyiPPNu77vpONHoy6auPiET/DBBFMjv04J6BDOaGF+I51NjeoBhcd6f1MBNUjZvmAxU26x+3ZPJ4EiQ2fMWp1ZUTw/UpvAuoko5ABknQruH07x8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033748; c=relaxed/simple;
	bh=Pdf7u8DrWmH7pnA5YtZO16OxY3wzSLfVOv8xrfAHUMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/ZpE3lb8NDgAbCTeXx40lD1oNf5qCfEzXeczKUPUSUYx0OZHmtk8+6oTcDIelRiIAII25Zf4F7VxwK/Bo1kfs3oiG1s5fKqK9NaYhvuxM3xIJ5nl713vjQ6ad3p+UaHy+JJaQsxFoCawxRSaMnDuL31gTvSAUrrBxL0i9o00s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oJpo9OOw; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oJpo9OOw"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c7229e85b5so147102939f.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Feb 2024 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709033745; x=1709638545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXH12Tos9R5LH3IGuLqHagwvQIUCehbeCr2Uw+9roXA=;
        b=oJpo9OOw+UDe0DzXMTwZ06YPl/axtD0njx6xKq2PApLtHwvqhTFqZ4aY4OnoN2YpRH
         8SpwkU2aSuow3mWNJV5ewZl8dj075k8o+QvlsRD7XjlEJHW9XvTxKoqzTOzQCqV71Fe4
         bzFyROcg+Fb4W9K9fF8uj2giuYZJ/76z2uYrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033745; x=1709638545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXH12Tos9R5LH3IGuLqHagwvQIUCehbeCr2Uw+9roXA=;
        b=bX43LFLp2LyRekb4IiJXbIzrkDpSiJdH1IHDrgxCetz4eqxTmAvYxNVRI1fCoca0xW
         y+ihqdTgx/Wt9jE4GNxPWGQSo5oVlSYv40k+iAI8RdZNyCD0jU3XeDJUYb1xUXP0Ozvq
         SqD7L/J1aueAEZVqvLUh7x4pxlF1gUeezz3kYpVNxCz76GYEbdQTBLGDT4JhyeJdPasV
         qDnbc0fxQybi8ZkdOEki8gioMrR6cQxmsEWmoY/h53ks/Ksi58nEx1C1D+Q1bZ9/PTA3
         42gOo5qeprv/GRS6AvU6dVcpai6dYkRgKOaxMffRmEz8vtcExcqnNW1TKnUzfCmY+52X
         btaw==
X-Forwarded-Encrypted: i=1; AJvYcCUZTVFaYh6lYWhtUVEbEB1/pX60cDOEFuFsodNRPVpMUJuUu4pWAAuZmYvT6jCMRMpLlEXRqHOEp1KA6prClNgI2/OaYy+IDEPRhj5PLdnkxw==
X-Gm-Message-State: AOJu0YwhopeYigVN2uY/eM0hkP70PRO0UgBVUc6xjTBJP+zPGDGQIUzM
	yD7r2rQYWyqIapLblBwNpn/qNoYLizx3x+fAvjLzmZi2tggld1GBoTAZ2MVHNQcEFqWSOYB7FnU
	SaQ==
X-Google-Smtp-Source: AGHT+IEMH1owIUGP0KgTp9aTmhmKVgFsxOPoDLTPO6NaES1P2Z24WM5p8+hB47tgoCm7C5yWIKqJiQ==
X-Received: by 2002:a5d:9b1a:0:b0:7c7:9f4f:2ffe with SMTP id y26-20020a5d9b1a000000b007c79f4f2ffemr11103664ion.6.1709033745408;
        Tue, 27 Feb 2024 03:35:45 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id t8-20020a02c488000000b00474337784absm1687584jam.115.2024.02.27.03.35.45
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 03:35:45 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-365124888a5so12114145ab.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Feb 2024 03:35:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSPXm/0iQsf9IvPgZzEV7r3lDdBrMm6FdY4se5Yrj7pwLjGC0E1P+AjFjzHuVCjiZyf7/p5rDbjapdE6T7ENWnaKXD6H/XWwK5iVbgD1qcXw==
X-Received: by 2002:a05:6358:1298:b0:17b:6c3f:1c9a with SMTP id
 e24-20020a056358129800b0017b6c3f1c9amr7617829rwi.7.1709033723875; Tue, 27 Feb
 2024 03:35:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
 <20240226-fix-clang-warnings-v2-3-fa1bc931d17e@chromium.org> <c25638af-d40d-4dbc-a179-efb6f29c38aa@xs4all.nl>
In-Reply-To: <c25638af-d40d-4dbc-a179-efb6f29c38aa@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 27 Feb 2024 12:35:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMVR7gqzwrhPCWb7dQcezWbcHxkPNLZJrW=TWaAn+kXA@mail.gmail.com>
Message-ID: <CANiDSCsMVR7gqzwrhPCWb7dQcezWbcHxkPNLZJrW=TWaAn+kXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Tue, 27 Feb 2024 at 12:17, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Ricardo,
>
> First of all, note the typo in theo subject line: vcodedc -> vcodec.
>
> There is also a similar (but not identical!) patch from Arnd:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20240224121059.18=
06691-1-arnd@kernel.org/
>
> That patch and yours share the change to common/mtk_vcodec_fw_vpu.c but o=
therwise
> they are different, which is a bit odd.
>
> Can you take a look at Arnd's patch and see if you need to incorporate hi=
s changes
> into your patch?

We went separate paths :), I tried to make everything const (and
therefore the remoteproc changes) and he removed the const.

His patch looks good to me. Shall I resend the series without this
patch or you can ignore 3/3 and take 1 and 2?

Thanks!

>
> Regards,
>
>         Hans
>
> On 26/02/2024 18:32, Ricardo Ribalda wrote:
> > Building with LLVM=3D1 throws the following warning:
> > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32=
: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsign=
ed int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned =
int, void *)') converts to incompatible function type [-Wcast-function-type=
-strict]
> >
> > Constify the types to avoid the warning.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c          | 12 ++++=
++------
> >  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h    |  2 +-
> >  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 10 +---=
------
> >  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c |  2 +-
> >  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c |  2 +-
> >  drivers/remoteproc/mtk_scp.c                                 |  4 ++--
> >  include/linux/remoteproc/mtk_scp.h                           |  2 +-
> >  include/linux/rpmsg/mtk_rpmsg.h                              |  2 +-
> >  8 files changed, 14 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/driv=
ers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > index 49fc2e9d45dd5..c4f1c49b9d52a 100644
> > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > @@ -77,10 +77,10 @@ void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vp=
u)
> >               dma_free_wc(dev, vpu->config_size, vpu->config, vpu->conf=
ig_addr);
> >  }
> >
> > -static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
> > +static void mdp_vpu_ipi_handle_init_ack(const void *data, unsigned int=
 len,
> >                                       void *priv)
> >  {
> > -     struct mdp_ipi_init_msg *msg =3D (struct mdp_ipi_init_msg *)data;
> > +     const struct mdp_ipi_init_msg *msg =3D data;
> >       struct mdp_vpu_dev *vpu =3D
> >               (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> >
> > @@ -91,10 +91,10 @@ static void mdp_vpu_ipi_handle_init_ack(void *data,=
 unsigned int len,
> >       complete(&vpu->ipi_acked);
> >  }
> >
> > -static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len=
,
> > +static void mdp_vpu_ipi_handle_deinit_ack(const void *data, unsigned i=
nt len,
> >                                         void *priv)
> >  {
> > -     struct mdp_ipi_deinit_msg *msg =3D (struct mdp_ipi_deinit_msg *)d=
ata;
> > +     const struct mdp_ipi_deinit_msg *msg =3D data;
> >       struct mdp_vpu_dev *vpu =3D
> >               (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> >
> > @@ -102,10 +102,10 @@ static void mdp_vpu_ipi_handle_deinit_ack(void *d=
ata, unsigned int len,
> >       complete(&vpu->ipi_acked);
> >  }
> >
> > -static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int len,
> > +static void mdp_vpu_ipi_handle_frame_ack(const void *data, unsigned in=
t len,
> >                                        void *priv)
> >  {
> > -     struct img_sw_addr *addr =3D (struct img_sw_addr *)data;
> > +     const struct img_sw_addr *addr =3D data;
> >       struct img_ipi_frameparam *param =3D
> >               (struct img_ipi_frameparam *)(unsigned long)addr->va;
> >       struct mdp_vpu_dev *vpu =3D
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> > index 300363a40158c..2561b99c95871 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> > @@ -23,7 +23,7 @@ enum mtk_vcodec_fw_use {
> >
> >  struct mtk_vcodec_fw;
> >
> > -typedef void (*mtk_vcodec_ipi_handler) (void *data,
> > +typedef void (*mtk_vcodec_ipi_handler) (const void *data,
> >       unsigned int len, void *priv);
> >
> >  struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec=
_fw_type type,
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> > index 9f6e4b59455da..4c34344dc7dcb 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> > @@ -29,15 +29,7 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mt=
k_vcodec_fw *fw, int id,
> >                                          mtk_vcodec_ipi_handler handler=
,
> >                                          const char *name, void *priv)
> >  {
> > -     /*
> > -      * The handler we receive takes a void * as its first argument. W=
e
> > -      * cannot change this because it needs to be passed down to the r=
proc
> > -      * subsystem when SCP is used. VPU takes a const argument, which =
is
> > -      * more constrained, so the conversion below is safe.
> > -      */
> > -     ipi_handler_t handler_const =3D (ipi_handler_t)handler;
> > -
> > -     return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
> > +     return vpu_ipi_register(fw->pdev, id, handler, name, priv);
> >  }
> >
> >  static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, v=
oid *buf,
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if=
.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > index 82e57ae983d55..a840dd2a48d0e 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > @@ -97,7 +97,7 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_d=
ec_dev *dec_dev, struct vde
> >   * This function runs in interrupt context and it means there's an IPI=
 MSG
> >   * from VPU.
> >   */
> > -static void vpu_dec_ipi_handler(void *data, unsigned int len, void *pr=
iv)
> > +static void vpu_dec_ipi_handler(const void *data, unsigned int len, vo=
id *priv)
> >  {
> >       struct mtk_vcodec_dec_dev *dec_dev;
> >       const struct vdec_vpu_ipi_ack *msg =3D data;
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if=
.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > index 84ad1cc6ad171..ea0c4a281d1a1 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > @@ -57,7 +57,7 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_e=
nc_dev *enc_dev, struct ven
> >       return ret;
> >  }
> >
> > -static void vpu_enc_ipi_handler(void *data, unsigned int len, void *pr=
iv)
> > +static void vpu_enc_ipi_handler(const void *data, unsigned int len, vo=
id *priv)
> >  {
> >       struct mtk_vcodec_enc_dev *enc_dev;
> >       const struct venc_vpu_ipi_msg_common *msg =3D data;
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.=
c
> > index a35409eda0cf2..b508136b416a8 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -78,10 +78,10 @@ static void scp_wdt_handler(struct mtk_scp *scp, u3=
2 scp_to_host)
> >               rproc_report_crash(scp_node->rproc, RPROC_WATCHDOG);
> >  }
> >
> > -static void scp_init_ipi_handler(void *data, unsigned int len, void *p=
riv)
> > +static void scp_init_ipi_handler(const void *data, unsigned int len, v=
oid *priv)
> >  {
> >       struct mtk_scp *scp =3D priv;
> > -     struct scp_run *run =3D data;
> > +     const struct scp_run *run =3D data;
> >
> >       scp->run.signaled =3D run->signaled;
> >       strscpy(scp->run.fw_ver, run->fw_ver, SCP_FW_VER_LEN);
> > diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remotep=
roc/mtk_scp.h
> > index 7c2b7cc9fe6c1..84e579940b8e5 100644
> > --- a/include/linux/remoteproc/mtk_scp.h
> > +++ b/include/linux/remoteproc/mtk_scp.h
> > @@ -8,7 +8,7 @@
> >
> >  #include <linux/platform_device.h>
> >
> > -typedef void (*scp_ipi_handler_t) (void *data,
> > +typedef void (*scp_ipi_handler_t) (const void *data,
> >                                  unsigned int len,
> >                                  void *priv);
> >  struct mtk_scp;
> > diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_=
rpmsg.h
> > index 363b60178040b..9d67507471fba 100644
> > --- a/include/linux/rpmsg/mtk_rpmsg.h
> > +++ b/include/linux/rpmsg/mtk_rpmsg.h
> > @@ -9,7 +9,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> >
> > -typedef void (*ipi_handler_t)(void *data, unsigned int len, void *priv=
);
> > +typedef void (*ipi_handler_t)(const void *data, unsigned int len, void=
 *priv);
> >
> >  /*
> >   * struct mtk_rpmsg_info - IPI functions tied to the rpmsg device.
> >
>


--=20
Ricardo Ribalda
