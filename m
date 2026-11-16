Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794831369;
	b=qL4KTJE2sWQcFxbxaXlJSTgHLyHo1qeuBSNYcBg3QkKNH0JOPWuXjcTnHLNmswTf+NQv
	 PXqIhzUZ/KAOompJdBWqkxDgrwbx6Ob4hr2x/9RQ56d2Jk0XqGUxaDXbt7hKaD+V21rWx
	 rpRz31RRHjrqciNqIVRF07i8MxSWXUV1TF7VMnv2ZeHa3zFnagE5ooZCUisE92on8a8rs
	 Q73qBy01mxdgUDlS7xDT1n21/LNSuIBTueTBlfFTZiCub8+GdsXayDzn58bHr/ZlGYU3n
	 EsXq9L3htqZqifG5y7GEiumo696RnIWsj4waDccKP5Si/k/G/uZNmi3Lec/sVFnn5PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831369;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
	b=hjq/8VZZO/S4aBYw/e+FjWuVlurwBq+LuMKZdouAIpv+0por+X5WG3tjcm+XSVUVYecs
	 9CBWA/7MS/sa8r6cR0RMmXgFVrmrXwuWwT/PrjFOw9IldB6hGWBiNykCxWjvgUU5PWXJC
	 VjjKQYcDioxwI2iRTtv5fRfPpORj1sm6cwWnB76sQXBKIZnWNAKzUGUbU3hpwyjQP4mbg
	 CO8Ldw+2sta64ufObNCDZFqi8mNlOCbqdF6ubdAH2qInKhFOBnn6THkhDpik5SHt/AM1m
	 CdkEp8DGVd2Cwv43Mj2LBHCoW9rnK/RaM1sGhwjk/gwKUWONfVeZUW9dqxevCNJ9niA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LBnZiDCx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cCyDJ2BK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B9606A323
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 12:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LBnZiDCx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cCyDJ2BK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794831367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
	b=LBnZiDCxJCSDN019YTAbFmVjeXRw4sJiunSV+PuxZXApcDWfWy3tF/mEhB4KynDwBKSUvk
	YlVhM+q9DlqLhe3Do8KED4HApnxFF9I1pX8qPalYpe21S7T/JeTVWnSVPHYmeQ1EdB5ITD
	sn2j8j71s7Ti4V8i8dBqj8Zh/HjKTVg=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-4C75wtJMOYenn90lVggGww-1; Mon, 16 Nov 2026 07:16:06 -0500
X-MC-Unique: 4C75wtJMOYenn90lVggGww-1
X-Mimecast-MFC-AGG-ID: 4C75wtJMOYenn90lVggGww_1794831366
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dad09bce0so1228037d50.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 04:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794831366; cv=none;
        d=google.com; s=arc-20260327;
        b=broBTJO75DT3dhibNI9+5E8nhs5ZcEeM8BmbC+XEYkx2t+uXw0P9VjSa892jwt0sQt
         DehaWGSE2O4iOwAKN4ZMlBUTKFg62dSpniuFo5dR0WaQnLE1+hB9lExOq2TKchtgb5vf
         6UTgmDXb/SQ7ykWXJSPESYkdtzLxiqvz4wK3bSvZBksdI42/srikBSbPKRApKoHhBBYM
         w1QslPi5c7Sdthju2R5R/IaiwUlSEf6iIQ0jhu87OwOBKxFDmkmDi5NrZ9tUX5PJFa7x
         Yu01jEB688iHG4Q1k2ouaA7d0qbkCwTUCnuFIFwjECLTAuO1JEA+fC0u3XNysckiaeai
         4DpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
        fh=88rqUgYUEJ9sPXlYXc8RWjDwvSigOtgdRNH2dprO1oE=;
        b=iCSxqjJf1QTitSHixOenXuiL+G8JUCkdSrEbdKviqV5L3+ijZqavFmlz4Fm8eqkeWy
         3Vembn0eI4kwPryJ109x+Sc1pSHCx2g+sb3y9Z2NHA+R1/2teHrVNG+l+vRV8x97k2Ex
         VBzVCLHBU/JNb60J9/wmC4Lvk3fwuoi+3cmuZQf039WRx4qEXmpXNFRIon4SFXgnz4yA
         h4j14ge7fmGRrm244iGniOiENoLJSIavO8xoONxwyRGm3TomAfwRAoLcy8f6fzG2O43c
         ARYfuwmyL1oiGyfw9visctYeTRD2TgiBCwgj6wx/OHoi/nuJLeINtDg/JkU3OmK0KHHl
         FcyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794831366; x=1795436166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
        b=cCyDJ2BKwUXeOCvgUXQHo40/SyHzF1IYjR6WQVkRqMquEZUy7h6/A6lxIUef3V0/y7
         nEzxF1sDf3tCKhagtW8s7YcwQoqZ/4Ioqp3n/zjwT+Pf7d2OhQOFCw1uYGXV1s3kFSWs
         W7W57amZjOJFcWkcEMMK8vUL7At6h3ysJIXKSPQCCnaqo9fIHFjl0Huq7GkJ5D8P26Ii
         222FaIx0f/3fe2ulGadev3hlJlp6FdGBwujCw7doGgk/FLjwiVTtqt4CzSNpkFCTBGpu
         BS1ZlDXK5syaBE3dCXEImblNuQT/5rixJCUg8bia8ApSIWfwmuQw/nl0YQ9ztKorcVbJ
         39pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831366; x=1795436166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hagfi1157KenUDCT/Gf/vwimxfuG+ZLb+Q+ggtjfRr8=;
        b=I0l8YNEckDpuS24NYqZ/N/xvi5Fz/XzrmC1kiPhLMebqGEPqvcvDxemsu+wPZ4Cr7O
         Qsl/tId1purtr5agm8r1sAcjzs/RI6/QM4QIlhVLhS8T+K0IMJdFV6ZDdO291wlujpA6
         zoTgUHitfcltdlBBdEg57pW+cYVy6ilgbE7BTOLL/kLs10bBHhVwNE3PREMAeiSWvefZ
         HkL6PpqFZZHJkB2+QLm4SXWptK8bgdIirRfo9KIt2Gq2/aGdnwN+ZvAaG5vZAuemrJTE
         eDhFk68vAp3PYFWwkAezB5jgQjfv3P8YKS7gQ9VLhlBBLpzg6tvWwmZiwDcLfnbYVmhM
         ljPg==
X-Forwarded-Encrypted: i=1; AL+hErEl5xQLqs3YUnfZ4jeIhoH7PAFWugL8DX1cnyxUj8c4XjwdJd6oFA/gpNsd0yd4nM92Nlh8dHKDc5a730lNoZ9O@vger.kernel.org
X-Gm-Message-State: APuU4Z9u2qrqKoLm7xPC4YZeB+nA2swRJwnRQQqatLbmS24uwChsxHlj
	V8GNrFMB6iEoQ5jPBT7LWRxNlX8mRrlmz9viSB1dEcYLEO1XYUkoPgvxFeOfGV3iRnERjh2uVMX
	FXVklmb6zIJype0qV1/v9IxB5e8BfDvefnfhLGOFdQoX7TbltyCTcXMF77N+ZNRMBRrV2m8ZvCm
	Zmd1HtyCVsdBabLIgKN9CxpzSZwABhiW0Z5e2KHj6eKrZOhQ==
X-Gm-Gg: AZFdTZe1N0TsMgpLBPRQ20hG3Vn0VV0TLtgEcoRHkj3bvrJIZWqSyjpvO1B1Mnd6bAm
	by9u+F8dbPWmOaK5yBDK9/93XUa147uIm00FDC4zQJYiODQZZyJh9cJ+YK55wGcUcwdtQC2mfTE
	8bApK5zFtkUnVCqnrj6FS0a36+rCJumQI6TmAXVA0kFxZu1MZ77mtrsm5QFnLSBYR4mdxLaZfKb
	vz0SjAklULLdABcP1XIcH6ImshY61e8KN8EX2DNX021fw52DQ4O2yTi/Tg=
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id 956f58d0204a3-67d89828203mr7426509d50.89.1794831365844;
        Mon, 16 Nov 2026 04:16:05 -0800 (PST)
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id
 956f58d0204a3-67d89828203mr7426492d50.89.1794831365223; Mon, 16 Nov 2026
 04:16:05 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com> <20261112154927.4004184-2-stjepan.poljak@gmail.com>
In-Reply-To: <20261112154927.4004184-2-stjepan.poljak@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Nov 2026 13:15:26 +0100
X-Gm-Features: AclHuK9hknMzCwQmnyctLW_nYU9P8TLzSSsy1qjPj1v2VPieAeY0m88QS7tIYa4
Message-ID: <CAJaqyWdB=qZddhEPmKPOdUDALM-3M3z2OvwWq6hzfTAjETQnVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] virtio_ring: reject a split ring size that is not
 a power of two again
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Francesco Valla <francesco@valla.it>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andy Lutomirski <luto@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, virtualization@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:49=E2=80=AFPM Stjepan Poljak <stjepan.poljak@gmai=
l.com> wrote:
>
> The split ring indexes its avail and used rings with num - 1 as a mask,
> so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
> improved queue allocation API") moved that check from
> vring_new_virtqueue() into the new allocation path, which
> vring_new_virtqueue() does not use.
>
> remoteproc calls vring_new_virtqueue() with a ring size from the
> firmware, checked only to be non-zero. With 100 entries, for example,
> the driver would put buffers 4 and 8 in avail slot 0. The device would
> look for them at slots 4 and 8, possibly reading the wrong data.
>
> Put the check back for the split ring; the packed ring has no such
> restriction.
>
> Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
> ---
> remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
> length" error names the cause. Returning an error pointer from
> vring_new_virtqueue() is left for later; the same change for
> vring_create_virtqueue() is here:
> https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.c=
om
>
> v2:
> - Log with dev_err() rather than dev_warn(), and say in the message why
>   the length is bad (Francesco)
> ---
>  drivers/virtio/virtio_ring.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index f683a2d6a200..f855b8d41575 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -3513,6 +3513,13 @@ struct virtqueue *vring_new_virtqueue(unsigned int=
 index,
>                                                     name, map);
>         }
>
> +       /* The split ring indexes its rings with num - 1 as a mask. */
> +       if (!is_power_of_2(num)) {
> +               dev_err(&vdev->dev,
> +                       "Bad virtqueue length %u (not a power of two)\n",=
 num);
> +               return NULL;
> +       }
> +
>         vring_init(&vring_split.vring, num, pages, vring_align);
>         return __vring_new_virtqueue_split(index, &vring_split, vdev, wea=
k_barriers,
>                                      context, notify, callback, name,
> --
> 2.53.0
>

