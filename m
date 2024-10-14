Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8F14A609
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2024 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728897878; cv=none; b=m943q7JmfXu17qQ4qZLKyHo/3429d4SAlbciG2765dwk3NMO/I4On4m2Q5pMjhd7tK77JWK9CsaK7fOuyQqHq6zm2/EbbB/8DR/NaC/MsFGEM8MgozfoiXosRdBK9RWcAi2/bywVBeI0wdp2I+iTG2m9GjG1iA5CTCL2Xyr0z0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728897878; c=relaxed/simple;
	bh=/e4tqHC/p5zxkCMGlUT2/bC91cPkeFYE5WBkqJ1XC3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNWcLGUQCdE1dVik6bvVEQgmVuUhDHdtAdFO0J5tg640Ds3l/AEWGAtk0JpybU0hdI05M7QLRJOwVUYA/sOxg1SKbBfC4g2TuhgtLaZXXsq/vZ7sfWWdp6QqTWHdm+gQtP+CJ7jWZo1aSiyiNVok8rJ45vClCkweP/joNdPXTDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=t9JuNJ36; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="t9JuNJ36"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so2944309f8f.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2024 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1728897875; x=1729502675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPYKRtrxZyyR3q/fRDlqu+geFEYUgeMUrrDvFjYtpas=;
        b=t9JuNJ36+VGJic9TMQz+0Ue7+OOxLUgwnVAfTGm9CbxYejXc//MT3AoJjcLnFz6QuM
         fpq3YVyGLY3GcLPZkRdBpMOm/TtswYpxMMjfCG352ja8WxAITNhJ1GsvyC1yKeYDNWow
         X0XBBmnVJbJTFt0+xOb8BkJcHKVva3YIeJdABq3gywMjydX+n0QlwSYdefmoawczN1Gy
         5HX03pZ/3muV35QeG5VlI+ln4xjfp9MEt6rwBZgmc37Fado6DI8gxo6hlDuiBgWqxQV4
         hDXfKoo6bnd26S+1d+dXkNXNlP2IgDs5vsIlVllk/94euZOXHs+JvtN0C3Jt7WpMee5y
         9MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728897875; x=1729502675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPYKRtrxZyyR3q/fRDlqu+geFEYUgeMUrrDvFjYtpas=;
        b=i+THAqvqtlxfQ6QT4Y0t0NuRD2mWj8H9J3245WduA8r+S+HvfVVNDtkYzlfmC+Fmj+
         TS0dYHiveqwq2hNRdHpQRHrND3llqXZDDZ/YMKRc2Aw950z2NQYqsK9tTu9T7K/NHRvF
         29rkCDsl2w/9Btbaqu9OOckrV4io0Fgqw1uu9A8HHKsW1qA40JQprv06GwY30ZdyAByz
         Dfl5Vo1VlLidZ8pQZltUOxhSYvZlGwMAcv8KpSgTknstMk4qeVuJuUzI+DCaBxXk2vYZ
         J5Pa/tuFxOtOr0NExGdqZKnvyF3OHcCAPup7o9wzY4sw3l7sLHTKqFI5IkcuPnraz1OJ
         zW8w==
X-Forwarded-Encrypted: i=1; AJvYcCULfISWAfFjTseVFY5jIIId6iByR+JAYOUD1LDumP3FZG1xVSPBXVeI/OVVKQJa1NO3SEpcceFttWVh3RCc0YoO@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbA5E/fhmmxoo4qByBNz75W8S8mO5hNSN/UxZtNjFVPmi2JNC
	wHGvt7lW5WhKQF7aBZMn/kxtGyY4L1FGb3XnyOyng2t1DUcB4FTkM58WCMoMGzY=
X-Google-Smtp-Source: AGHT+IFHhT7ivLRs+wCzpu3gM4i2ZM3mZebwzlnJSQKdcY986zdcpiLJ0nRbULkMD61QdjgH1Ga36Q==
X-Received: by 2002:a5d:618a:0:b0:37c:d225:6d33 with SMTP id ffacd0b85a97d-37d5529f9b4mr6484698f8f.55.1728897874663;
        Mon, 14 Oct 2024 02:24:34 -0700 (PDT)
Received: from blindfold.localnet ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d784sm114836605e9.46.2024.10.14.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:24:34 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Richard Weinberger <richard@nod.at>, linux-remoteproc@vger.kernel.org, upstream@sigma-star.at
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, andersson@kernel.org, upstream+rproc@sigma-star.at, Richard Weinberger <richard@nod.at>, ohad@wizery.com, s-anna@ti.com, t-kristo@ti.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rpmsg_ns: Work around TI non-standard message
Date: Mon, 14 Oct 2024 11:24:33 +0200
Message-ID: <2480985.jE0xQCEvom@somecomputer>
In-Reply-To: <202410122348.irTWFe4S-lkp@intel.com>
References: <20241011123922.23135-1-richard@nod.at> <202410122348.irTWFe4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Samstag, 12. Oktober 2024, 17:53:16 CEST schrieb kernel test robot:
> sparse warnings: (new ones prefixed by >>)
> >> drivers/rpmsg/rpmsg_ns.c:55:25: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected restricted __rpmsg32 [assigne=
d] [usertype] ns_addr @@     got unsigned int [usertype] addr @@
>    drivers/rpmsg/rpmsg_ns.c:55:25: sparse:     expected restricted __rpms=
g32 [assigned] [usertype] ns_addr
>    drivers/rpmsg/rpmsg_ns.c:55:25: sparse:     got unsigned int [usertype=
] addr
> >> drivers/rpmsg/rpmsg_ns.c:56:26: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected restricted __rpmsg32 [assigne=
d] [usertype] ns_flags @@     got unsigned int [usertype] flags @@
>    drivers/rpmsg/rpmsg_ns.c:56:26: sparse:     expected restricted __rpms=
g32 [assigned] [usertype] ns_flags
>    drivers/rpmsg/rpmsg_ns.c:56:26: sparse:     got unsigned int [usertype=
] flags

sprase is right.
I missed to replace u32 in the struct by __rpmsg32.

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT
UID/VAT Nr: ATU 66964118 | FN: 374287y


