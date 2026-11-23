Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443164;
	b=FzjagyQKdzCSe8z2A7Rl5LIAnThgjpReMyp/3MAW5fDXsnov/lWpeL9EecsDsDcRKYgd
	 jVgnxq6nCiQojVKOiQHWzhiEZ4qi6kwPUTD0mujaI74+vsA/MIedWiAmy+jIHKo1En1vk
	 1a5PnBDGnKWt1E7oeGi4EU1r/41GhoyfoIX43wp2FUckJx0475R3wObayb0GgSAW/vs1r
	 o/QRRXuvUq5+PIl+yIeU6W4CL+4m8qsSW+APgazEoRrNJnWD1nQOdFNsr7Naev9eopX7+
	 /toGLdu0da7fBRIEb9I9mtICGoRRqN6gqnFI4JJwi4WLrtZqjW2fxhMzwhaDWCuVJTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
	b=uNWS6Hc5boZwY6L1pmAN2x8k4k6p21RaC/N+22P8Ddd+vvyfETJsLDS9EvJs4RMzqCsi
	 Q7JL30V/xqAXEefz+rCRMA0k802TqoCmi92pIu4ExR2i/aQwXQx+/wh37MaCKOuIXSNGN
	 +Y443lZHjZUXm0lDWnzj9I2cqtWeEL0oaeabG1ox4oAI56MCxDi1cYzqTMLcWhs6PRBGN
	 gDXwV8vt3O2qIJ4AauFQ4zD+SuqVgrXEsflkwiUI/KvqvWEvnbP352XjTDwvUMcY7CsAd
	 0v6F0d2fqNtubw6cvtUvQOWGO0dh8CxKPSliDVbnou4Fh1BqHh/mKKMmUIPgQbzHN+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NCpzLTAq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9C606A336
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 14:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC9C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NCpzLTAq
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d543b6b6so17247987b3.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 06:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443163; cv=none;
        d=google.com; s=arc-20260327;
        b=W9F8EVUI/BRAl2zeAsIxUD5BO16JbR33U0DPk4FYmUOhNMTAim+cGAcaxMNabb9ZUw
         N5AeRbEB3LDREEYBVrn8Dn1ZVTInbxbYf4k9W8UXjdopXHVnuZjmP+0vA0MoI37odvNI
         NPq37tUJrEI89WhD5lU/9s9QbhmT9ngg/Xrcr2tRVHautLv40iCltgChhSm7gbWgWnTL
         Pd4QcTdrHr1+ip5nn21JXVeLgSAsWuPk9mmgzXln0AbwNreY8kZYmB7aX7PV6t4pzxAn
         u36Ik5ShaRhEWK5hW8yYVMFqnH8O/pQHWdz7uyMTjzl+IeRFDK/LkWCANF0sPbLvyRI2
         g0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
        fh=nvm4xCwVtjkrB2bK+FpZVjIC5x4lZukOp2+1tHhuqpo=;
        b=W1xflX2hJjaElDCkVd/uKq8TXEq9kmYtABCnwcJDqG/vpLUl9iHhwoT7G7ph4fAAdA
         nOmspdSV9THSlHIrB678U+V2D/TcbCaNukVVmJZUT3a59zLTMDwc5a1HtIqU8i0ohWmN
         UUQFgZQsOIWF3LihNtEpH0kiV1XMKBralNYu5IyY7lr3XKPBnnAs+p+OVMOZz4Y8mt48
         aGaD+pTu4Xly+jvNd2lGrtrzDUAflqr9QGpjMybnhcxoG/NDV3dx0NKcQTbyoVjisQts
         9W5vrLcrsk7cpahb2LO6mMAKpgdurKjjTWEBv7FO5qSTphvgyAiEBzeI+/j/vLahTFTk
         bXuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443163; x=1796047963; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
        b=NCpzLTAqoKBaQ3KVbQj6YwKJp3A1WBpm5bfvC+0PBFFfZAALv3kQhBF+Fst0LotYdE
         HAvRy9agb63TvB+f6ZNIjNN+m8yQVGiv5qD+OjvUT26OXXWKOjFRdwDBEI5FSgTtqqE/
         +ZcVV33xN2ewf/Kwvf/XVspehaernWJ0ncrLm3DdkLsl3mJAypnuImVt0ixLX6kj81K0
         F85t99ITJr1LR7JS1tk8PH9JFF2Cim2TPqfTZb+OF+45kjxL2CIih4JDa4+XZ1qidbjf
         xnfesk3osKHqa9azZXKG5Y3/48C4F3APkJGRhAazQhVlA5kqWhCPoXMHnDQpR2SVLMbS
         4NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443163; x=1796047963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
        b=0htR98m4dvD/4aKRTs05A9pwaXaSfmZ6ivYrbjc7FoquQMNpT9HeJ7h2dapbYv2tld
         rtQkAXxSIcV9+++E1LlHoY0b1M7mPmHo/MGDN5rFebJxjZV+iVZus/MspUUSWmRNgWow
         IPspnwWH/KA6VSRJhuvvsFV5rHYYTLicC5EmpoDPPpUjL4s5XgpU6dOAiNTNgcN0N53G
         MKsVyyUlTtfaN0rILk8j2ecC4GYGvcWU4TYPSqar+OuZ/PG3MjStv2aT4V2jdm/X+8ZB
         AVxtVam3FK9S3qQ90ewG/YLuN06DfkF21g1EtzhMszOhOORt6dSfrxRICI5NhM8htF2G
         DPBw==
X-Forwarded-Encrypted: i=1; AL+hErGgDPgQ/+KUm6AAqI0yoktaMoJ9zwdscPs/OtgzUsXuOS3WajxYWnlZSLL2YZvcqamRmUxfxm+EuGPoFz9T9YXN@vger.kernel.org
X-Gm-Message-State: APuU4Z9/w9gFVdqmgwxFNPoiiAt1JR+c8ORu9HoL13A7r/J9beKTwVDS
	dgHZAUFyBbQBsYjH/rBxYJ37SS3ufA8xoUKWqfOfbw9J8dAsm/pT41sIRrq917+Q/vk+aLyFH1X
	z4mFd6pDyiK9oAhBYGNdDyusZOjpS/ljZ6aR7b8AnBPT9lrNr4KFo
X-Gm-Gg: AZFdTZfBda3DoJIsPNz8KPrwfVBPtPISkyZoMlsMoz0JzG1Culhhh6QFvZxsKspXJNf
	c1UpAJ84MkNHdGlMoqOXBhUq05TpM6IroMBFmLX1Cys8dA/ETGi04qoasyBuwMpSmHCZ+GTrL9V
	OKUryszfPcA2ZouPX1wSiIM7Mwkr0F4WhCUPOFvw2NzJpELndu42JeiqjYzCD6Ur0Pmj2loo2TJ
	ZujFHEj3rIlq3xmj99+YLOE4QlFDxagtSGCMvavNJWZmUPfgB5z/q3/ZCXV0pr/VxlIR9fL3qtP
	e+5T5rGZ3pJsWXNPt0QG3mCvsn540JBc7YTLbTt9F7SWCX11pL+aAbf4mLEQKf4J5YTJddjwaEL
	PN4Hvk+VNttRve9SLABWtcvtGOz23/I1hGt6EeooFNtoQxZS9yb0Iix0q13sccjoSNDFtUIc=
X-Received: by 2002:a05:690c:4b8f:b0:8b0:e10d:1975 with SMTP id
 00721157ae682-8b520435695mr34860627b3.29.1795443162921; Mon, 23 Nov 2026
 06:12:42 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it> <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com>
In-Reply-To: <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Nov 2026 08:12:31 -0600
X-Gm-Features: Aa3M54rloAqf4WAjz_5cyU4l0UPfO3oYekEeRTEWNkBzcSFDmJDGM5H-lLlDof4
Message-ID: <CANLsYkwG-C_CRDr401zZB912U07tQHJHNa+LWd2mgPM9YRgcNQ@mail.gmail.com>
Subject: Re: [PATCH v2] virtio_rpmsg: Fix config space alignment
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, openamp-rp@lists.openampproject.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 02:12, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 11/21/26 00:01, Francesco Valla wrote:
> > The comment for virtio_rpmsg_config says that this structure is
> > naturally aligned to 32 bits, and this is desirable by some
> > architectures that don't get along with unaligned accesses.
> > The content of the structure itself however isn't aligned, and the
> > __packed attribute prevent the compiler to add this alignment.
> >
> > Fix this by extending the version field to 16 bits.
> >
> > Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > Changes in v2:
> > - version field extended to 16 bits instead of adding a reserved byte.
> > - Rebased on current master.
> > - Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
> > ---
> >   drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
> >   include/linux/rpmsg/virtio_rpmsg.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 23ff6c8b7a20..27282475a732 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> >   static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
> >   {
> >       struct virtio_device *vdev;
> > -     u8 version;
> > +     u16 version;
> >       u16 size;
> >
> >       vdev = vrp->vdev;
> > diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> > index 0872cbca4593..57f48d537de9 100644
> > --- a/include/linux/rpmsg/virtio_rpmsg.h
> > +++ b/include/linux/rpmsg/virtio_rpmsg.h
> > @@ -31,7 +31,7 @@
> >    * the structure is naturally 32-bit aligned.
> >    */
> >   struct virtio_rpmsg_config {
> > -     u8 version;
> > +     __virtio16 version;
> >       __virtio16 size;
> >       /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >       __virtio32 txbuf_size;
>
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>

Applied.

Thanks,
Mathieu

> Thanks,
>
> Arnaud
>
> >
> > ---
> > base-commit: 5f22fb20497f4983094131f00a734362300d22d2
> > change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> >
> > Best regards,
> > --
> > Francesco Valla <francesco@valla.it>
> >
>
