Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B53159D
	for <linux-remoteproc@vger.kernel.org>; Sat, 16 Dec 2023 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wizery.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wizery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wizery-com.20230601.gappssmtp.com header.i=@wizery-com.20230601.gappssmtp.com header.b="iji/RbfY"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbccfd048d4so1203585276.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Dec 2023 11:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wizery-com.20230601.gappssmtp.com; s=20230601; t=1702753202; x=1703358002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIw0KKUn/sOJBPVAoLZOVp9Vicr1Z2LvCEsaKQOJ4vI=;
        b=iji/RbfYRGlkGC1aqPTRRA1fRi1x+37MCNA9+8uRxq9SS9MZk6RfuMNb2MriP5OA10
         tR5Wrev0UwCVOA1adLbUHNwx7Pf6UBBxCobNp6RsZy8VTVgfvsVowU/m7rP3vKOeI5nz
         oQXfi+GR2w6RTT1bfCHk3QM89bWl85b8iNaJT9iFziAU9HrXRLTSQaeJmNL9oLr7vhdu
         YvS+KOMcyKhcf28lLPeb7Ve1kdwRy6BWJSDwoAepZxh2L85YquhiZh6x9sGCDEdJyCgf
         dfLgh9cjNykWSopFmUc7NfMMjv11tAu9BDd7DO4DeOSMN7dVXs+D25Q6pAufGgegX+uL
         8mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702753202; x=1703358002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIw0KKUn/sOJBPVAoLZOVp9Vicr1Z2LvCEsaKQOJ4vI=;
        b=Zj+Wgs1vRF6flFlnVIKJGr2i+UNXMd8TX9LFvM2JOPMB/yyaFabPwLp7MoWfu3YhzI
         MvTOAKm+W8afYGG7G3zvstCu6BIt56r7NUADxwyX5G5p9B6eXIe31fpJXvw5iEvw55Fc
         btYWUyNwF+vKFkI6EnLchieW1P+yVxs8bijlQPdkDURJL4SGy9z51BfGpselSCdpfvh1
         3BfglvwLyoZuN2MsvVrKPPLNpxK/PMGD9D4J2FkcZIwaD3p7c7IdWug2S7JsFszZ3Zhc
         O5/XyMWuD7OVKf5Rm+EjbxlKzkkh24PumL4y6QlK8iRoZtDh8Rg2M9/LCqcCYi+Hiwhr
         JkMQ==
X-Gm-Message-State: AOJu0YzPUm7RONemEfw29Hu3uaH5HN9VH47FTWtuA9Yc4Bteriec42HE
	aN2xLmMi9230+hTKejcwXnHj4ZPvbxmWXjjE5JtJjQ==
X-Google-Smtp-Source: AGHT+IEu+BEXHnMbI0ik6h0fSzQ/20GsZF57JKonaLuC0uEMnoISaaztlU5S6nY6t42nI9n75OQvE9qmJt3aQCsJS+M=
X-Received: by 2002:a25:2391:0:b0:dbc:e53f:8703 with SMTP id
 j139-20020a252391000000b00dbce53f8703mr2406150ybj.100.1702753202061; Sat, 16
 Dec 2023 11:00:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231216111017.17624-2-bagasdotme@gmail.com>
In-Reply-To: <20231216111017.17624-2-bagasdotme@gmail.com>
From: Ohad Ben Cohen <ohad@wizery.com>
Date: Sat, 16 Dec 2023 20:59:50 +0200
Message-ID: <CAK=WgbZcM8qEm6EOT2FFLNLoJC986UYpjEWK2O6-js0P=4No4w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Ohad Ben-Cohen from hwspinlock subsystem
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux RPC <linux-remoteproc@vger.kernel.org>, Linux OMAP <linux-omap@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bagas,

On Sat, Dec 16, 2023 at 1:10=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> --- a/CREDITS
> +++ b/CREDITS
> @@ -323,6 +323,7 @@ N: Ohad Ben Cohen
>  E: ohad@wizery.com
>  D: Remote Processor (remoteproc) subsystem
>  D: Remote Processor Messaging (rpmsg) subsystem
> +D: Hardware spinlock (hwspinlock) subsystem

Please also add:

D: OMAP hwspinlock driver
D: OMAP remoteproc driver

Thanks,
Ohad.
