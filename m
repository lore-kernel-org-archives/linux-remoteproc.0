Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794234008;
	b=dyWxZ5mdAzkUGDzn8XADhBGQaEVbZcc9gS55lq62tSjXFibv55mfhX/mmSTRsoIiSE30
	 iHcL8U0wF9HCdg591Oe8cHZSbW0hpqR2nUXQLv6TWcsUYGYOkrLtKaUX0NEJvIpcd0ZNG
	 ATOqn16PAvBjKIb25hMK3zKmsRpgm0gBhrusPAUubRfOGBexcg4CU2U/D81JKYsPnQdvD
	 cqVli0IjVsCWd62vfi+E9U0Z6n8sX/4EzwSImzcuRoqmoxL1AhYICnDtgc49MHDrly6E+
	 yB8YEeD2QS9FqWs3ZL7xw4vcXAIway+eT6i3ExWmWw9rp9rBWragvQnWnoT5QVM6FWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
	b=tn0vEtikk8TwxWUDdjjtcdG0BLm4vmXp0+HlMiM5FRgR/G1nRtQa7DD8g4FmJBtWzg3s
	 XefhrNW/bTqVzOxmeVAbQIFbPJYN5ZFM3k0nJyvQ1ZgAaq3mg8Yqo+QJ2PDH2EQ6k8Pfd
	 8RyUkMJ5Qva/ZUq2GI/wzumZntwrlROVSjuuJVPCPwBr6Kzrsf3cC32khhTxteG0oe1Cb
	 uBL0Td9iQe3ybX697knxe59MYnjlHHIlYMmnMV9fYF8ozDxOYvzw4HZ8m7UO4Gw7PPUoO
	 myQX6JnxfMj/TqZgeS7gBu1X90iGsloywvhbtXJGzGG6OZY3jSnlwFGBjdGegYYncMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aF4vOIxk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636D606A321
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 14:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E636D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aF4vOIxk
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b33a08df33so7519517b3.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 06:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794234007; cv=none;
        d=google.com; s=arc-20260327;
        b=lDSqIDxtpx8oihh9I64Dmo6kpCpOMNHjw7pSN/uzpMGoXd9vZqpZDIIrzye0DFuHnS
         FAnlEIPd+IO4yTI/U2n6K6ImZuzOx85Ncx4w+FGLUw+AKO46+IEziDpMjGwxG4tb54Pl
         NPjSt8a+jlCk0sSTOkX2MUzQF2I6lT4Jgt+WSBzCWrOwau38ZYPpu1JXlJqYw+ESUlWa
         XRl/podJA9mtRCCRUMtBs0x7TsRlcBPC8kd95EismBLc3bb83G97kcTxXYomxEhZBK9d
         3NlWepW5WZSnCu+KZrvIV0d8AA8uddl2IyVI6hubb13ljx3IIqnkQS1UP07V9TyIlZKM
         BFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
        fh=zVfS7wIxayE9AsX3pSecUikugJenB7lVr6DdsJ5A3Og=;
        b=Kforb2K+yRxHy2FuPX4I9HIZ4/36hEp2eoU1p20swYRgDauxVP5qHuw77NBo0JE83V
         mZG7JPJrfDHw6JXg/4m9natGgwhoDEkEUkZU6RsqcC5HXEkIzqbIrf3/JMHZKe5b3cxg
         PIV7SpMcYn/7N387UuQq06bgiXOdKAHTa+Pm9sbFsX6S2XaFuInIzs6PkjX9AVU3OQ7A
         NTtVa0e5k92J/PQFRSLX0jFRYSJHHWy+7SdGFKU/yrHTaDkqBtAmO5u6QRCAtTO77jYv
         2QoS8yIJQIkNB81s5Nb83EpL9mTdBkASsGT8tfbVKDaHVvyTJ8UEE/mpvBWh9fLnf8uI
         RK1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794234007; x=1794838807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
        b=aF4vOIxkJCgakd8KOW28+MZPpGfUWLWvNDxZI1wYbvZaqxUwtrxPGJ9k1IRwxArxxm
         LSfVJl5rdSN10qfwpJuXHdYQ18DwCOy1tFe5Y7OVgk6EZWSXw8pZeGS9gLseJmX9gb3Y
         HbGGsIBVP6d5a50oym45y23rCQWs0/rJENM76OO8//1j0yWSfBsnkswoSLY1x25FHFtZ
         LvM8k0Lflv9gWyCdqAe4e66Yg47o45xV58C+Qp5GCkBmx/kgabFJPjXevZ96eiBqZS3K
         KLQ9USIU1eVFFvM9X9UJEepwUKF/7dstuOe0bpsIZ+Qwhj6Qn/HsnSGjXT8Zo2EtX87Q
         znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234007; x=1794838807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KPphWv5faerQ+f+y2QS6kBpPhy/DbtYHiDVCfCM3mZc=;
        b=NBZhc7E4lbeZrXKB9IfOfiocXGmCJVYYmzICQaeV8HTaBvnIs/kY7SmWbvA7Pxzf7v
         ed9Ymf8IflSmwxljB8AN8QEdTe88QkvYVufpeWqj4yMNBAQszeYIZbvkIV4I0KgpCQXZ
         lvYy4VKsbn/fGZnXqluRxhlu5lIikLz5IZvppcKvlP7JpI890hTjcoOsrkvrcpnIc61F
         lUepwErt4vt67COLObr70vPC7hZzSfbXVxbpsi1VAt25NOPOxqFsSLKQ/PUPIeC2wJ+Y
         V13CAt970WRH8Nm2DmQVv+Yn2KDVBNFEAIn3T6L6/Q47YXhiVCP/MD/dnZxZkHhrMYpE
         wyfA==
X-Forwarded-Encrypted: i=1; AL+hErEZ6b9pC+bbHuy/SlzReT4qONcQVoq6Wi4NX+gpNluU0EWo7josPrnYepIferrLKi0JELclMLUoIDqmgo7PkVIu@vger.kernel.org
X-Gm-Message-State: APuU4Z+v5C49h32TXhuW54FlYImH+M99J8S0BYFSfkbhxoPEYJC+If49
	rvC25uK1mapeH9/EwG7elu7oXgUNEIr4yZzX6WT7Mpe+vjaHzHa+VTe0+mr5q0Hrezk6+lYJJ/0
	QQOQXbED52W+49eZKysd9M/8/BJ4DqWP01/UwV3P0QQ==
X-Gm-Gg: AYBFou3oaw9Mu5H4rVNTfa+5XDjmtrp4YIDg4IxYTY0LXsvUslt4tWYX8x/Q9g5WYb2
	hauurIW6xXFKtkHm+Pym1u8t7+fqIgiIDauoj2EXMimm9+5iddfcdhdRFu290n3upTfueZf263x
	ssxlduyjVtB3o6XwBV9FJfNcemr1Q9BNkMVCst7cCc51+hoKcrU8g7r4vfNneXmyi3VjUkcyYz6
	6Y0khDi27ceRXhOdtNDMR0QODLZTFS5CQp3GfmH8IIwoOb+Ozbi0gSMHLp8UM08A7yVfuZuIU1G
	oCj+aXJvw2qgjC9GsOjnTu4Ubwp9GNS0rf8uiDyP6DnlLpi7fdPLhvM2ZLScXYnfmNMT1oTocCB
	Naj/aVb5hvB6I6GdAxvspc3ehMQVkEwlKBfrGr2YrMtmv4Gbmi0CFfBO8jTceEEQ83ij9KA==
X-Received: by 2002:a05:690c:f02:b0:8b3:4911:2dc4 with SMTP id
 00721157ae682-8b36c9fcd1fmr27817757b3.16.1794234006642; Mon, 09 Nov 2026
 06:20:06 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
In-Reply-To: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 9 Nov 2026 08:19:55 -0600
X-Gm-Features: AclHuK8JMBM1Zrd1Fm73Mt0ilMAi-qlYe3cHAl4uEn_pkEsQwj_7mkScPt9WXZc
Message-ID: <CANLsYkxRsVOi1FiD0CosRop06LA8yyFAW43Ex150fKHrCa7OYg@mail.gmail.com>
Subject: Re: [PATCH 0/4] remoteproc: virtio: Fixes and cleanups in the
 vdev<->pdev relationship
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 16:32, Francesco Valla <francesco@valla.it> wrote:
>
> Hello,
>
> while proceeding on [1] I noticed a possible simplification on the
> rproc-virtio registration and tracking path, which led to the discovery
> of a couple of bugs. This series is the result of the work that followed
> and thus contains both (proposed) fixes for the bugs and the
> aforementioned simplification, which consists in less poking the backing
> pdev from the vdev side.
>
> Patches 1 and 2 can be collapsed into one, but I preferred to leave them
> separate to show the reasoning behind (and to allow cherry-picking, if
> that's the case).
>
> If anyone is reviewing [1], or plans to: please consider this series
> first. I'm in no rush to have that accepted, and some (critical, in the
> case of iommu) details need to be squared out, while this series fixes
> what I think to be real bugs. I would have preferred to spot them
> before, but...
>
> AI disclosure: an LLM was used to review the work, but all code is my
> own, as well as the commit messages (I'll be happy to fix the english,
> don't hesitate to correct me also on that).
>

Maintainer disclosure: Code and changelogs written by humans are
preferred and given priority.

> Thank you!
>
> Regards,
> Francesco
>
> [1] https://lore.kernel.org/linux-remoteproc/20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it/
>
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (4):
>       remoteproc: virtio: Decouple vdev from the parent pdev
>       remoteproc: virtio: Rework memory release
>       remoteproc: virtio: Drop rvdevs list and associated functions
>       remoteproc: virtio: Stop de-referencing pdev from its children
>
>  drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++----------
>  drivers/remoteproc/remoteproc_internal.h |  4 +--
>  drivers/remoteproc/remoteproc_virtio.c   | 53 +++++++++++++-------------------
>  include/linux/remoteproc.h               | 10 ++----
>  4 files changed, 43 insertions(+), 58 deletions(-)
> ---
> base-commit: ec1f9ba57b02fe12a6fa5f141206d439ba3d044e
> change-id: 20261107-remoteproc_pdev_decouple-9933eb3a5998
>
> Best regards,
> --
> Francesco Valla <francesco@valla.it>
>
