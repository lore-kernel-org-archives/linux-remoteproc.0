Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353A3D5C31
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581038; cv=pass; b=txiD1/H2UpX9fYkUIb9XQ/VE+tcMXvepMDCHzkLmK9TmkJRB1CGAfU4L2G9iemy9T6wLCnuYO8RJLsi8SuYqs+Wx/k5zMD1OZGAhiu1uY61+8MzPHDXq/B8xLWt64e5FI3VoYp7AYtc7tuWM9UVmRqvkSYBjpAVXsod7YwhwM3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581038; c=relaxed/simple;
	bh=QJQ4NjCwE66XT02iioTKX32pf9F/+INr+LqpJhuBU4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2ORh4S2J0Mjj0yP/XIBZ2TMcfuiHXoc2yS6lqkSUKoxiKm3WmljVQ2toPvsc/EOdG25CI6xszssVLYEw/vKyOtSGeqpRfu3u/o6/gV4aGDJyFpfArAfSNrhInyfTVuUD7JJgpvGqLS0TmXtJ3ZjFasegdwgCDYtykMm3wit2PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+34F8Vv; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+34F8Vv"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a980c1153bso2225951fa.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 14:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581034; cv=none;
        d=google.com; s=arc-20260327;
        b=oCnpw69tsj/Lsom0QbfmK0az2EvFaYnc+JpPogs5RKbF6u58v1CRbVvWfCq3xX6pbR
         3uVugrCJx8EhbaPuRS4j6ww+3Orhp2rkRGnh0EWE54Kz6udYAVJgw9xe6pNGmr3cBjkx
         0Ai6AfRD3VbG8iK5GHhLpOGIYrDOCCrMbrIAdtr6LEb8sdHy9iinRFK55RoPWVfpgxfh
         kInkejqtVTWBN0GgqwY2OnU1NK2Jq9j0ua37bPtuiq8VWepEIn0cd0KjKGMY2YsaKAew
         9Qrf2JdVaFzFB+RV/sbDZLOIK34X9RldBZAgWSlZI9eXJPsvcgSA0CHpQmeEEiCixgeA
         oWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0WSRCUE49PDYeX1lwnIRvdxVfyb7jQkBCqEh4RPFRb8=;
        fh=IEsN4cuQR+d9g2S05vgZXN8ey1KzliuqkO7oFgoWE3k=;
        b=VBe33PtYDF5G2SLN2G018FZrhM3r2XVOGV9rY8qYU2vwOB1YqOxFyXNoDVsqTSqCm+
         dcM+J3kkfE/2GdHGUklrACcUwsH9Y4WnuDV7e3Rt321s3xNowQWnRDaPYITaGK5zCw+N
         wU0TBWrI5NXGsv6vyBpFX7zt0dLuSzSVfvwoi1ZUFP9atwX8Rz3tn6NQ9zaByf6po09r
         mxJwoBbuknHRi7FEplp9vjjWQkWLmtZNyZveX2pKWUS1p70A8CUWfEB9xtlUfamXFt4I
         liWNvYlq7Og3jXlTryYL/93pNQWIRTTXTsUVwQ6O1evNed6dk4yDTQ3JB9QOYdhN+KJ0
         NbgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581034; x=1792185834; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WSRCUE49PDYeX1lwnIRvdxVfyb7jQkBCqEh4RPFRb8=;
        b=r+34F8VvigRXQh2KB16ngQx2oQhmF1RTz1OyuX5X6c68cWdzzrolW/H/mMCUQXlj2z
         oBUz6hURy3qTX7Jm2MUjzpNoWD7q0kba270s4MPZushLkd1kuRLgH7VFOBqvvFImPS4j
         +6Jsb6Z4lx/Sn6yChRVwhmAO3DeBBZLm+iZqctn4L7LT8KhvJKvgK4BgztAEVSCv+XFb
         4yptLdRUaQJGwbyn6KIE9iactb81TFGqhMsLmgQJV2HzpD/wmViu0CsQ5+bic9mP3pYy
         KMqvBwVa53u9wHRZIDPEaLxzU6iYoI/rTNgu4vGJ1XGAud2ebm37Tb0HZu9jFL/hiHom
         ZbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581034; x=1792185834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WSRCUE49PDYeX1lwnIRvdxVfyb7jQkBCqEh4RPFRb8=;
        b=qJudHwZSHMhuzaoSPPlxznSefCzHQnpB8zflo6LTQhSt4SPragShTtZErPMYSi+hVX
         EF5TWjz86h3IrKShtiGrdM3VWBfYzlaqfWUrsMFLuEyKbru1kaSf14/RLtVr++/51pA+
         CTscb6KSXhq9MeGFzYNLs1H030aSX1jJ6NAF2fWMMRh4A1zj5OScL0fe8JG89IZ+jmG/
         yEVCLqeO9opAvOfFjP26C2V7VIaFNwP00K2R1uY167GpzvmzHHXHxebjjE/ZYpufbZP0
         RYYrJj9tqYxaeyFgerjjqLp2MNhOwXOJAiFuGRhyrxyg5yPZhJ0NYtTEgC44OGFbKf5+
         71TA==
X-Forwarded-Encrypted: i=1; AKwUvBx35D9TYwURpq/YpcrjZp9Qk+ZginQSfLEjUu1KgU06oKTO7VhBj4zMsD1x1mQRFrWbWqP9LX4gC3PjQZk9KL1E@vger.kernel.org
X-Gm-Message-State: AFq9FYIZDWDzyQmhehxJW9NlS8e0ml7Kn6nT/uH46BZ3O8NcRMYACvxX
	Uv+Aodj9o/D7F7aYs7KBsuBhaxfsaTOCKKuZjEyEsYQTpb7nWAiOJOmrpHvXxY1a/u3aKaYNRyL
	gMzzVZ4W+OOhV/S18dHSeG5eNLZlk9UMhutJPWjh41w==
X-Gm-Gg: AYBFou1Z7ubsu7i8s6InSQE7n7neuLeeBw2QpMw99F+oPVS2dDBk27XQqWGZyZgTGL3
	q17KDT5VGChEHxIaUCKUoZstToXjEpBTJ5PUmOGUaNkH3/rCNK2Ogk25T9zgkb5zPyx82ch/7mz
	BGjn6n/BA2qLeUOWGeVVdMXuiA60YpL6fhSEZaMe8QHsmtqXX/a+w1yg+w61W+CsYKaWrjmayBa
	Tn7m2O7JZQQbLUouKBOZTHpVFCE6lvzIJeFL7dr7G8vBTeXgNoWya8il37lnqhchBxa4HC90JQt
	lQZ1VSst1Owz5qhLHwBw8hKt0IYy/Xr5Sc58wpuhjyHYqoeOro+RvJ5bv5NMpPjf
X-Received: by 2002:a05:651c:b0d:b0:3a9:9856:aa8f with SMTP id
 38308e7fff4ca-3a9c55db18fmr9884551fa.7.1791581034241; Fri, 09 Oct 2026
 14:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926041943.1124650-1-oss.patchbox@gmail.com> <askjD1DxFvrV5ND3@p14s>
In-Reply-To: <askjD1DxFvrV5ND3@p14s>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 9 Oct 2026 17:23:42 -0400
X-Gm-Features: AclHuK9Oo9BEgQkUPo5pIErQItBppE_Ru1rb7SmpvCfvBKSwmVbbZBnq9jbCxTw
Message-ID: <CAGG=RgA04aBS1QkTWoW-yjMZ0MxB0x3bTM47_MZr-yK04DPDVg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 13:23, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> > -     list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> > +     list_for_each_entry(vq, &vdev->vqs, list) {
>
> How is list_for_each_entry_safe() no longer needed?

The first loop only clears the pointers with RCU_INIT_POINTER(). It does not
modify the list, so the 'safe' variant is not needed there.
synchronize_srcu() is
then called once, after that loop, to wait for in-flight readers. The
actual removal
still happens in the second loop, which keeps list_for_each_entry_safe().
