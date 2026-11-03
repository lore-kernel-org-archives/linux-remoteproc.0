Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793678976;
	b=Gw77btdr+uN3Vk6tF3r5h94vOeoquumijeZad+bb+uwq3ij32Hc/qF3GQrsi2XJTlzEv
	 L9gKcQRK5F+ChC0k1Kbcv6y9ppcuXUrz5jomv9Jg9JciTTELw1mpHQBVVSfc90WsUZjc1
	 lb2V4GPDW/8U+qifhtSBAm1yMR8beHxfvFaJnChUyxGSHjq6jeRkjdmj8Q6kZIt3nKZpR
	 Bi89ju4BFeN2F/Rwb+4aQbIpbcVTvVZ/tsN35SWocpZwBARHjepYOFXSk7+QDbZ3fI9kQ
	 WgKL7TS+HZrRP2uB4UCHYBrFA1wjwLKYRqoHZhAiKGkdZxbEbPp5+TylyNVZp2VK2UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
	b=PKOy/lMwqsGhPdAreqAD0nhT7563UJO1tSAM/z+75ybcr1rGYviDP2QXLJyn+yAoF3zh
	 s1sAPB2c/lr3eNqgFeZYh28bU0/cgjkdnQdJx5ESDAfJ2k0kVy9c3IQjOq+2lcJFpqRGc
	 0x+kpTNoZcTCaNRbKAIECfD9fYcSBEjIZZMts3t4Cx0lNsEBCOLuJxSeGZjmGBn6aPrZB
	 TmSGORCJRjKWEhOyk4K97oBeVzpoEFh7TY0g/7D0Ozd4Mk4b0mGUGi9FpK7Ok33DJ/gfK
	 iEnpE0nMQTZ5peIB12BFeX+tRr6XsigtDkCVBZVPHTt4ONckCZxf7Ag8VsP41azd7YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9Oe40HC;
	arc=fail smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D06606A327
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 04:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D06606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9Oe40HC
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so2945011fa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 20:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793678974; cv=none;
        d=google.com; s=arc-20260327;
        b=RQ9iLUr2XucjWSwlE5FlpZU7ywIEAG1zrRlA5aJZqhwFL7Yp/mX2gRQIOKDpEgwwOL
         KD6VWPMm8aI+Vx+icRCYuSJ9et5XnwjdqweDmGvqHAQlxcggD5rrYcR+VsXkgTHf0G/l
         qXjt/O59pBds5u8Sv+g/RQPZCLMBJJOQnHK2IPwMabYGwJ2PM08cD4KdkKZaPQ6bbVNm
         rpMQYERzRrV7+MzHFZ9H4WT4EOSRU5VAeP7nM260Nbmv3Upd6GqnXWvp1E1NOmTKPQLi
         X2G2/kVX2V8+SixHc3Ihm5ufuS91Ce5njSYpouVcRBpCC+b+XI0FYBhBMrLVwzDEeKS3
         aR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
        fh=8PTqJh0nQpDpzy1f/w70R5m3gbEw7PSSL8B//mIzT+E=;
        b=WRVV67vgDn46xtjmEEfnqafBMtXwTQe51dnSNOHHcZlHCcYej+gFOD9MTnWVEe0FME
         whElf94OGFdnM39thz6Cxiw8dCXyJXMzpaXafXbSgAAi2w7asnOi/rfx5qiyX8gicrmu
         Ug2wVOfxNLa97BQKNDGJSMt4C80XFeP8ac6tlfthM1oClV6z6Y5q1CGdGm76wfqza65z
         5d8QTroP84LpE6ENAZHUJenCTt93jaWbIx8aLHh4UPGqnc22a2bnD3engGtW0+iet2N4
         UBGGlZo23OWHZUNN/oNEQVudy1fcYFVtqto6sJwGabLlP9pw8hUKqbwVNsNb+PTNdAJA
         c/UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793678974; x=1794283774; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
        b=O9Oe40HCGOmRZfS9ArojsTOkWRogCLAA8RxP7OvgGHe4QdWC8+f/a/UhQiCIqrzFSR
         Zf9+JCBgW0u3La0oKPOF3Rm3Uo1kkRh986BsRwuHjs0+kuh89j5xdGlurOo3gPMyc4DT
         eQdNNZj8ulP6qpC2nI68ljZ9XYYIret2oD+U6FvbOdoNw4JucvZaChg+qPE+GY08uTXo
         8vZK1h0MpZlpqlwQFPeytDtE1nuBIwwFY62FfSeZ7gLvq4m72c3Q2bpGaL04KSlALTTo
         j7SvmBVy23rklLq9v5dKeZwEDM7ar4hvp+hQ03ssTzFhdy5tOEZDivhWCTrB87kxpjK2
         K5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793678974; x=1794283774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4iC8L9iLkA3pQkFSYs2y6EQR6cAV4OUXqfYAj5Wz1OA=;
        b=XZtSqwtn4sQLRcghvKIqR80qnM8j8RUMzvDUBaeGlCZ6OTMC5hovcOcr2Jx99HVvGb
         FzPBvwJ5HMM5U5GF8U6RCbeK06Vi8XIqOPmvn6Q4RdQNGr20Izs6op+Nw1VvLM/PihmG
         lLhsXNlBEJMyfaiDbHhK9XoVycFvcP/sgTtF3kzZydvNtHnbkjQCnNSayaveEJ+ut/jx
         rg0hUqVUGxRgwHKYRHP4YOQFvoSWESUnhizozdoNdpc7lGcnI2b7XDt2pbYyqyAhXZme
         95s3bfKOP5L/lzqb7ezXqWP2Fmd1hGzzNA00d9Y+XopBavFEeSmbjAFoht4u9PAV/Lii
         mPOw==
X-Forwarded-Encrypted: i=1; AKwUvBx/+ow8LipX4Ocl/+IQVtiMqz5KNSduFvFGSkcI/SzrxxrWZVI+TSrhzM17mGRjBVEwL3mt9/j2AvF71awJuInO@vger.kernel.org
X-Gm-Message-State: APuU4Z/czQ43ktffIlWN3++JX7U05nyGE+RLcLRybVZwS52qqDND+Oq1
	60BOAP/rNxSzo4uePWAmXPXAIX4QLJ/cG8fS047d6AR//nfWWb+bftGxsf75UIaTpNrSePDWTLD
	FJ0uJyoAn2RdfDiOBBbU1ZTEOetTCpps=
X-Gm-Gg: AYBFou3x/bclBK1rQuo7Xz8KA7aKL1/OOwtMJpn0xdKAMRBgPw1soLaVyWdee5KSJHM
	8TuIYuKHhPIS+lY5Ry6MmhVtE4u8cDKS5YrqxVVL4DDQRkWZa+aMIDva1k2B9ZO0c0vOFGUhicG
	imsnJSHWswN1Vha5Xm211XHlbOMFuKNY4lIPm4lIspBvOhMbK/gGGARpQKvI2imPBdxotTcUZ+H
	KX6dt0vw9MRptDU9XNKtg4rExQ2rkanqJCQfQ/hIIRD43jfZ6GWbB0a1Nb5eLUIqZ2RQITu7gps
	I5H+Ayr84Kc01ff4OUVXgXDa5Wn8i0RMKONGeUgENEc4v67ZhyFbqaubIe7b2+dIfUclbLUMh5k
	+PVSFbJpLXM26v51p2mxFD//ncNIWLQVS9AQb
X-Received: by 2002:a2e:a99e:0:b0:3ab:40b1:c4a4 with SMTP id
 38308e7fff4ca-3aca57eb24cmr35150011fa.14.1793678973932; Mon, 02 Nov 2026
 20:09:33 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260926041943.1124650-1-oss.patchbox@gmail.com> <aujDcTjvpWbIJ8wm@p14s>
In-Reply-To: <aujDcTjvpWbIJ8wm@p14s>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 2 Nov 2026 23:09:21 -0500
X-Gm-Features: AclHuK_exdT8gjqeTXLCJXxzkdg7czt6b3ePUopm67pTCoxxb-Of6GIPUcH4Ph8
Message-ID: <CAGG=RgBW9O7PfwaDPY_jYkE876EALQ5JsSnP4=7YubZg1XvwJw@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 12:08, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> This patch doesn't apply on rproc-next - please rebase and resent.

Thanks for checking, Mathieu. It no longer applies because the same
race has already been fixed by commit ffe14d610cb0 ("remoteproc:
implement synchronize_cbs() for virtio devices"), which is in v7.4-rc1.
Therefore, this patch should be dropped.

Thanks,
Yuho
