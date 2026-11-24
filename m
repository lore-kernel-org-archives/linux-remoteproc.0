Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795531233;
	b=KRmh3fs4lxfc3Dfq84VpT1OVbr6X1L2Y0vUlXYjOjbkRgmj8/HC1VbaYBtflfRAP6Xmk
	 deNxb97gSdbDIUERtP1SpeMXmgqYHAVtg2VIZXLRmPKihOn78k8BE2/liqIUb4dZ14pQv
	 gR+ZGUl5ZI4gqqXxMKe0A9jVKoZEmqfwZsUVIVFEkU4E2qQ+vEWiETuTmodwf/8cVvjpr
	 K9OuIhbyDPkXY5aG+Bve15DT5lHis5fIWamybTsxTyjJ0jVqkdCxOgHg3QEbibZmm3irE
	 QjRlHYlaKtEXo2MC82N+sc52s7v/6PaoLssjHYrlu54mF1/0bOE/tQAtYV+QSHMOEnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
	b=L/P+Dn3SmAs/wxitHlMB2tfy1eZ80CAnU3trCzkCOIwjJi4tbgtTbBUr3WINLc5BhXqG
	 M17w8ZU1wLCbHyqYAqqx4zbL1RS5ZAjlrdaqGfnrYcTu3pVWNRY5diCVO1kNFmIR/nI5j
	 p94BC3qDElg12GKJwjwORB7TG5SkcXXObR41PP+xuDDKmekl0WCRVjObWVJYzsAfcbOct
	 9dy7dNiDsbhXTOWhHWjk8f7C3CGjhWAHoPE1yBKlCR8GUImuyuIQd4m8801YGPaihXI9a
	 Si/ziu+VY7zCBRociae/8cppgAK/TvUMn8DcGTT0sHOST60MjHWwm2YfTSuBwP5++fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RE2fpDmm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E97606A31E
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 14:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RE2fpDmm
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4e2fcc300so39582467b3.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 06:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795531231; cv=none;
        d=google.com; s=arc-20260327;
        b=rAsPfCVSI5bZf2Gy+DEwvMh0nAEbyYnJ8NEFU5/wnrpy/5aJbIbUjB8jVm54aXuye1
         blG70ShXgmWnvsIY1seZfzLQV0I9UTFSTEdizRx1pxNd6+iMJDLJEIpFpuPzKuxCKW10
         AHTRKY1w7GxXI6LVh4eueyziKUQMCcuZCUdFatW8Vm7WpGukQ5BGTUXQvG/hMNTlKC5R
         lwCfj+ugw4dZTxS6XM7QzWp+olpGi2de6WO2A+WnIWNPOkEnBrAqn+2xi5/lCVWEKxgT
         bmRfKUEuYLLfDgSWI2y2C5hyJo43SoDqrEPyI94T0tp/L+jjr5bDiWUe1LpIf4zjGtBO
         Ylqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
        fh=/4cxoWkmJyevSn8lC/sYV5/kVtMtnGztgDSyc/yM/nk=;
        b=Zvm8Xy+K4Lvfmtqlzxutz+WVF+e2VXtDWf19a5oGI70cHIJoniqe1XwEFmPIfi/1kM
         tLKn+qAKwk5Xa0f7GVDU1wGRRx2Ec8otdGOB7//LBjGtFWvJ5QK4hhGd+WOz9jO5MycZ
         3JDfmtXIYx0aErHNalRgk8msIau2xtK+caYnCxhVzxlju0U2d0I6YdZbYoSzbb+4Vmg0
         i8YqzfzrlIB9JKdHvinnimgmhEDbv5P0YA9HH3XONe0zZtdkaXvpYKlSpHD6MsjNnaBi
         Wo9xCvuZ/pwAf1qvG2wAlnFvc/QUragAH2LbcXntcHHfBFnBVlLLiH+7cWHfuMWqM88f
         bVJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795531231; x=1796136031; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
        b=RE2fpDmmRGxLAB5IwvdG6EeZPbbr9KiR6/7V3FNW/P7FVUwlQ0u7/j/nt1MBMwH7Zd
         gQ0SA9yYYy34SXMXny/mFO59eG2X69lXh8LZ/XWRh47U0GIyJnRvWEoj5O6YDwOsyq68
         uoSH+XzdMevnVGFIcKB8hjLNwBHuAojdPfo8Q4T5s1998ADW+bcYxDePAUWpCRV60tnm
         X+utJIh52B2fM002f1SQR5yQPBbrnYMSf4G4T2116SRRg4TtpC4T2qOG1fc9iJZ1nXYa
         L5XtBEqFcXfJYb1y27zSqdspO9gY5ONlwzvsoBDBntPW1ylbAk1B6nwBBQCgrXB81bXQ
         w3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531231; x=1796136031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gqJ0koBqYuIfxLesC2bugH6KW4yTY/e4+Hl63jNOIHg=;
        b=eoJ+tMAGaiVLVo7+osfDupCZAj/Ku2sgVFicL7muSEWr8hMiUD1XDerO/C3nK1/Nnh
         9/wwicRnEufj6Xu7qB82GdRsDq0xjzP2yS+ch0Fuv6i12lx8chjXteddKexap6absNC2
         Gyd3q/uw1loMb8boq1PQh+IAXEleLgcqP8O9lutnqRDvqHA8nzhKOXy1NrGFtc4aG24E
         x52gZN2tBgnNBP2MVMXngmq3dgZSA7T37jcWCOgWpJftykA0hmTf+QK0h0gdYoxcjVjR
         RtkktK3k9kQXdHRGSBO+AL36DIduViSwgmYQMm+VOfC7HsMEKGDUYp8F0qJ5kqYVaVc5
         uJBg==
X-Forwarded-Encrypted: i=1; AL+hErH8Y72dUBBqpHb/t2H/X/BByaWksBPiQAUCufSmBImUgH/8PkLOW2nbun2d1z4r8bo6vPKP25/XPdBIOaIolmjW@vger.kernel.org
X-Gm-Message-State: APuU4Z8LTHetO61Rx2JlmQGMARwcgIDPa8mqdjl8We73HxanihdCMLKg
	v4hHIKN0+mxL3hjlnMY/5rFk8fL1GDAwn9lCdZOoPZ4Qasm6yWpjBASX7TWJgMrFnxerYFsfwpt
	Gqnzx9fg/N2+P5tAJnsiwFfj8RMUNUDWDMmvNMFP1Rw==
X-Gm-Gg: AZFdTZecISBPTLOLU5S0Bv4jtxgP4wln4n1pjHY2jBzGRkfvmTCF5E/pPoC1RAp3EK4
	Dvb3CKe1LVNMYajdOt2gOdUMs35mzRoGK7EWQJyyH8jBC8mV40qCaYdf0mewhZBoGIpmfyYMFc2
	6yH46joM0tcKSvYHAUYemDtj0klePSw5atfT8ZUvRb9zwYfouLSK/pbHSfJw3eH5eOTj58/7ZXa
	O05weWXdnCDM4Mz6azJ5mj9zfvNLUwh04wAnTqNodgpqp0hIndz/z96rNWYHNKF7aQl4ugY3TYO
	KcktMryOFyLQf+lC/3JBmTqTvXSjjTmzRu2++CdMZB1WQwJ8MZ0I0sokbCg21xjSAnS8m5I6FcB
	+oRpirhGVec1pofgxuN0hobyZT8O7n/i96CMzlJ711v1i68eO2qMR7S1GDY/vO7XUSifmHw==
X-Received: by 2002:a05:690c:89:b0:8b4:e17f:f811 with SMTP id
 00721157ae682-8b52043b59fmr49196567b3.28.1795531231263; Tue, 24 Nov 2026
 06:40:31 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it>
 <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com> <CANLsYkwG-C_CRDr401zZB912U07tQHJHNa+LWd2mgPM9YRgcNQ@mail.gmail.com>
 <49f11bcc-9a21-4181-929d-2a45448435a0@foss.st.com>
In-Reply-To: <49f11bcc-9a21-4181-929d-2a45448435a0@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Nov 2026 08:40:20 -0600
X-Gm-Features: Aa3M54qhMiPKmawPDyPT-hF5V5oAzCmKr7vYIkhlrbnrB_GG1bDCMFqEyB5qmNk
Message-ID: <CANLsYkzvE2byGERHnijGKyTxbEtL6Lr69si226ONnpzWXr7fHQ@mail.gmail.com>
Subject: Re: [PATCH v2] virtio_rpmsg: Fix config space alignment
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, openamp-rp@lists.openampproject.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 12:16, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu
>
> On 11/23/26 15:12, Mathieu Poirier wrote:
> > On Mon, 23 Nov 2026 at 02:12, Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> >>
> >>
> >>
> >> On 11/21/26 00:01, Francesco Valla wrote:
> >>> The comment for virtio_rpmsg_config says that this structure is
> >>> naturally aligned to 32 bits, and this is desirable by some
> >>> architectures that don't get along with unaligned accesses.
> >>> The content of the structure itself however isn't aligned, and the
> >>> __packed attribute prevent the compiler to add this alignment.
> >>>
> >>> Fix this by extending the version field to 16 bits.
> >>>
> >>> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> >>> Signed-off-by: Francesco Valla <francesco@valla.it>
> >>> ---
> >>> Changes in v2:
> >>> - version field extended to 16 bits instead of adding a reserved byte.
> >>> - Rebased on current master.
> >>> - Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
> >>> ---
> >>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
> >>>    include/linux/rpmsg/virtio_rpmsg.h | 2 +-
> >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index 23ff6c8b7a20..27282475a732 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> >>>    static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
> >>>    {
> >>>        struct virtio_device *vdev;
> >>> -     u8 version;
> >>> +     u16 version;
> >>>        u16 size;
> >>>
> >>>        vdev = vrp->vdev;
> >>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> >>> index 0872cbca4593..57f48d537de9 100644
> >>> --- a/include/linux/rpmsg/virtio_rpmsg.h
> >>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> >>> @@ -31,7 +31,7 @@
> >>>     * the structure is naturally 32-bit aligned.
> >>>     */
> >>>    struct virtio_rpmsg_config {
> >>> -     u8 version;
> >>> +     __virtio16 version;
> >>>        __virtio16 size;
> >>>        /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >>>        __virtio32 txbuf_size;
> >>
> >>
> >> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>
> >
> > Applied.
>
> Could you tell me whether this fix will be included in 7.4 or integrated
> into 7.5?
>

It will be part of 7.5 and it has a "Fixes" tag so it should end up in 7.4.

> Or perhaps both, if 7.4 becomes the LTS release?
>
> I would need this information to manage the compatibility details
> properly in OpenAMP.
> Regards,
> Arnaud
>
> >
> > Thanks,
> > Mathieu
> >
> >> Thanks,
> >>
> >> Arnaud
> >>
> >>>
> >>> ---
> >>> base-commit: 5f22fb20497f4983094131f00a734362300d22d2
> >>> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> >>>
> >>> Best regards,
> >>> --
> >>> Francesco Valla <francesco@valla.it>
> >>>
> >>
>
