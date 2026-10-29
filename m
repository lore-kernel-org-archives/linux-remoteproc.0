Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300505;
	b=W0ofdJB6hKCb99WNAbTUJqMqBJLfaG68dX0j5YwqwQqGR2smNKqtA36RRftYHwzQZQmK
	 IWUB85GVdCfs6h39eN/5QwrfsgwupbfYfkfWQ7/ODmB2THxEHvqt94u+4omxdLA2rnAcW
	 QyuljBysQDZByU6iJnNh4scFCXSlXW4nu5z4NLF+czNC7/gTLaY9r+JHM23B0gToN/7WT
	 R1ih4TX46hGziH50nDF1mFKBCBzpkCasr7PbuklEkMc9Kh5afb+/RSo2Ode5jVHNBeiGw
	 3bvjllx/lXPtGIJWXPrMgq9JX9OXsjwfl/Q9QNgMquSkhWxBFBJUkrr3/8zCG2L1K0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=OyRG2U/nfr5SKigCKODDocSbzRjedm2EI/bWSrZ9Jlw=;
	b=B2N3izpnAi4+HGRmLSIhVBpWVwsSGukPmV5qLLbLZ4oQ+d6ILrIS2ydgTKVXpACQc4w5
	 u75j6jU1XSFBTG+WspeVG4d4yi5EJcheyltGfgENn+8sJAqJAUu2U80/wxqs6tte6g1Gu
	 uVftXsgg2UU8WCssvVaVHW1kg1SjRlBNS9zLo6Rx0d29mZcQxh6HyOW0kfUMHYwAOle+G
	 OrwDXEl+Xe7RLOOR+tGWz8wSbk3ohyuCNb+refYLAC02VSmmx4NCUvPtjZ5V2dwFuIrd2
	 OYGihjeHh4nqlF260oSLGnFOn1bK7kgiouOOVuti2rmTAzJNjSWXDRZf8VcK4LJy2vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oigccN+s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED2606A32E
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 19:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEED2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oigccN+s
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4541643a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 12:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300503; cv=none;
        d=google.com; s=arc-20260327;
        b=CRMGPg8NOXyyP8h7gaLkr9HvTezI/JElW7/Slz8SYF8u3HN9uZeQVIy5rVxSvTG2X7
         GaAYLY1rIDioPIv0Q6qWobY901mn/9LbhoKL1DuIJsgDO7m7SyV265KR1+cVn187ErlL
         70PT1wkwFPs5qcV/pU1u8szIQJXiddCV8Du3jGiEFg+oArpBQlDeVyu6q/BMrh8hEZnD
         50ZzML/yZjqJ0KdXbZYv8OtuyCne+Ldre2MAxbLbNzz08BH/cpy08bxeKy7lhHo3/UWS
         LdTDN7lJadeaFPj9WP9iSI1Qgskdorz84NnCgmAyUIzZ2k4e+m5WvMf0upQCa/iC5TVS
         MMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OyRG2U/nfr5SKigCKODDocSbzRjedm2EI/bWSrZ9Jlw=;
        fh=eMjrs77kHbGnCUbGJ7FU1lOGqv8Twc5UI+ffQ1h7HJQ=;
        b=eUdRJcNVsnSUG7vfR/AWyprLSdLfYUgcjOXVLNkCNFAFluMcu/SRl+SDXdwIv3nBEB
         sso6RfOtlucTLZ3ZUGTEzeu9ASUmT3upqvQqEYXqKcXsWjE4rnM1+cjCKQ7NXLY49Oie
         2XL3dncKO61guPGmKArY1yzPgNvrDoxw9+bc2sG/oNlJj/zoBIVgtOwbEN2yIDlq++I9
         Y0qV26ynfacbh7mERkN/wgsQkZT/KsQ+FjV4FM0Ljicgr7QND22S0o4sb8SrDrRmXMfy
         p4t3VPvERaGV3Cxu659nGgvmfab+YfwMWxcm42J91CfzBf/fwyl4znhTPF6W2bVsMLCm
         05Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300503; x=1793905303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OyRG2U/nfr5SKigCKODDocSbzRjedm2EI/bWSrZ9Jlw=;
        b=oigccN+sYHLJeY6hruVBua3jp4nlfpt2nr4UkzAQhjnfzJ/qMEBfgFM2qVZgFWlhMu
         O/LOvNxpTB5qACT9i2VNT809T2uu4bS920Z0Ekm8hKYBukwFDUNgZJj9ZiHQC+SpK+hM
         Or8trP+3g+xhU83Q+9HZRasFom0sBMUQHlC34Q8Ug1rh+QH8DVcZwND5GFPpVxxWWL9/
         iaiZ7jHBBTV/QSzeaxOVgIDavs4tPOBmU8Q3/W/soQmi3np7qgx+fRG9NJ72HKfxzhP1
         v6vJCThkLFA5D/6HryFCQZD+QPsI8T98ltIlsxiw9nuNPDS9/B5Uxa5kFougpBQruBgd
         2CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300503; x=1793905303;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OyRG2U/nfr5SKigCKODDocSbzRjedm2EI/bWSrZ9Jlw=;
        b=hxv/QsRWnjUzCJruy76sCjcygOhZrCo9o3Ju5L+rYq8RLuqNRmsJ0Vq5zEbFYGzCLt
         QLUL2dGA4kMePBTd6J7eMrbxwP4ygvJHcwZNAQChSFoaKfrDZ75Weq/AX8M6OA3UgWNn
         tBhOqTXT9GiR8ZxTdd2tNy6cZSgVXH/XQGLRakGtYIVJDA2dVfOM+OifwFGKApg5MZ4F
         y8Y/ZkkVdSy1tA8hZOU3giHoUXFzP+3petw3OG7+uerLZuINnDw6phM0vlIMxVVtbkad
         vT1YiAz+CgLlWFipmYWNHXUDD9fyeJagvNZ6jRBPsGr5XmfFby6sL5CAqNsAqN9RqV/Y
         unjA==
X-Gm-Message-State: AFq9FYIU0fQP4C37EpQLBOhNLmKgrWRZGJVR2CoEiE7Cep+Y5qchw6jS
	+f8vgs76MNC498Kt0TzgClorBr+4FXFwXqH/H9A5LWiD5wvSnCvSijLEC0Po8Hb+2cy2GlMSW/I
	+4t8TdRSUyxOFa2EnWjQFtIlg+GrxhKg2F+v9
X-Gm-Gg: AYBFou1antYPBs7jFXPG1a0fncHqORJnStAmstwTfs4gyYVdzO5Lp++maeNn7KAsZhc
	Cs2LvNLVY7X/YOmDFowya3H3ZTH2ZxQ2wOs8QR47XNMbhDYVKmDD7jXqLrRttFeozMjsovsrS4W
	N1NS1kSJtd60OlD7PDzfFKIVVN3t0PLSYwsIFvZ4nyP0A0aNTz7gEk4cWenjvAp032bsce5cXmj
	AxKSyRBLZ7mVn6nuLtwl+2rkeD7B0FAGUmmTEHD5J97XiFE76dCRh2w0O9LOntMDj34b94gTe9w
	VW0gjuM68cZpVwNCNYfslOQubq7ZBLtqfd6F0WKNOurA0SCcivVFX6wWUmx/cLloisWCjF51IhQ
	+B6+JGeDGCnv/zaWUHZdqTi3nyaa6S7FQKiLh/Fw=
X-Received: by 2002:a05:6402:528f:b0:6ac:686f:91db with SMTP id
 4fb4d7f45d1cf-6b49cb52d2bmr4711051a12.11.1793300503030; Thu, 29 Oct 2026
 12:01:43 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Atul Akella <atul.akella@gmail.com>
Date: Fri, 30 Oct 2026 00:31:06 +0530
X-Gm-Features: AclHuK-11B3cHhBbVamGuTGsVCL5PMv-gw8iE2UPDeSFC8rhtlzgGr3ENn8eKnQ
Message-ID: <CAKGVfCBR_syQ2hVpa8hn124opab=V3aYmwqtC4AE2GghfL+eUw@mail.gmail.com>
Subject: [RFC] rpmsg: virtio: reclaim TX buffer after enqueue failure
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, Atul Akella <atul.akella@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

While looking at drivers/rpmsg/virtio_rpmsg_bus.c, I noticed that
rpmsg_send_offchannel_raw() obtains a TX buffer with get_a_tx_buf() and
then submits it with virtqueue_add_outbuf().

If virtqueue_add_outbuf() fails, msg is not reclaimed:

    err = virtqueue_add_outbuf(vrp->svq, &sg, 1, msg, GFP_KERNEL);
    if (err) {
        /*
         * need to reclaim the buffer here, otherwise it's lost
         * (memory won't leak, but rpmsg won't use it again for TX).
         */
        dev_err(dev, "virtqueue_add_outbuf failed: %d\n", err);
        goto out;
    }

The allocation itself is not leaked, but the individual TX buffer is
removed from the allocator's usable set. It will not be returned through
the virtqueue used ring because it was never successfully enqueued.

Conceptually, I think the failure path needs a helper along these lines:

    err = virtqueue_add_outbuf(vrp->svq, &sg, 1, msg, GFP_KERNEL);
    if (err) {
        dev_err(dev, "virtqueue_add_outbuf failed: %d\n", err);
        return_tx_buf(vrp, msg);
        goto out;
    }

where return_tx_buf() returns msg to the same pool used by get_a_tx_buf()
and wakes senders waiting on vrp->sendq.

I haven't implemented this yet because the current allocator tracks
buffers through last_sbuf and the virtqueue used ring. Reclaiming
buffers would require deciding how to represent and track them, which
might be an architectural decision worth discussing before
implementing a fix.

Would this be considered a real issue worth fixing? And is there an
existing preferred approach for representing reclaimed TX buffers, or
should the allocator be extended with an explicit free list/bitmap?

This RFC is intended to get feedback on the ownership and allocator
design before I attempt an implementation.


-- 
Thank you,
Atul Akella
