Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10237876
	for <linux-remoteproc@vger.kernel.org>; Mon, 18 Dec 2023 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wizery.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wizery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wizery-com.20230601.gappssmtp.com header.i=@wizery-com.20230601.gappssmtp.com header.b="N/3zo5n7"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db8892a5f96so2129381276.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Dec 2023 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wizery-com.20230601.gappssmtp.com; s=20230601; t=1702906591; x=1703511391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1Q+zkEvozAEMPH7+PlxGKj4jlAEOXxsDof6pWa1inM=;
        b=N/3zo5n7cr8z0e8fS39iMYf/AfFgBvfWdQVZL7avdhI+dX5MxIwYPT4K3dpM3MD0gI
         sGjObtF4Q9Wvz+ALssyKtWUx0OcyY3foy0iJebF0W6pUHmGsrhce7frWYLeGYd5SI82Q
         V1GEM8wDvvsCGKKXyiLC/weWRQRDe0c/2rUmqVEzayYJY81YcjGuwzfShc0M+f5seCt0
         VbBYKfhegyKhMjm9xW3kR/VCGM/2no03VL1ZmmoGm842wSVYlMkdACzYOKTnLoF/zQLp
         VO507x9rOctwImSubebm1C2KqDZ+jJDjQ6ucwjm73QLnEZNeJbK1ILf6tqSjaH+gSpLF
         cpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702906591; x=1703511391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Q+zkEvozAEMPH7+PlxGKj4jlAEOXxsDof6pWa1inM=;
        b=xGxnDBzMCmTUTWsIaIqa2iYekpR4Rrpd7h3Hm3MJBbjqDC7DSCiQ265wEr2GTjqury
         tpgMk5QGJymf+mtJg+4twUnFv+Z/1HQwprnnJyuL4IHClkBGzlv46qMgpwn3mL/a7lcX
         6e7WEaEKdESmI/mT4bmw/jorTnMaxXCxncEnNK/Sy5ElSVHd47F+oGrvQ31hRQB1zx9I
         uGiOU3eX4krsPq9UKOjmskPAMEr1rOfIF3dR1YUhwTDWDv+1NdB4RvcOJrAfwDUBViZb
         wMScHIhxNWfUgLecBEPgaDrTZqjAmBIWiaXUgtfceaVPPrMZ6ejncTfEr3c1JQvw1t01
         2IYw==
X-Gm-Message-State: AOJu0YzJdYWeyOi1CPRCVSg9EXwTUK34W9oFItEmXB80QTE++oShkQai
	BbbUJJq5ArczUV12QLOVE/uhEy+Kvex5bwxUtrQHdQ==
X-Google-Smtp-Source: AGHT+IFRiFASHsEIuPxB9DH7eGlgjvjqSybAmPcflOdzRQaWzdHZYCjupXmJtUwKiCXDd6Js7et5QRcmpTWF8pT7Acs=
X-Received: by 2002:a25:cb94:0:b0:dbd:4629:6fa8 with SMTP id
 b142-20020a25cb94000000b00dbd46296fa8mr274388ybg.56.1702906590733; Mon, 18
 Dec 2023 05:36:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218132830.5104-2-bagasdotme@gmail.com>
In-Reply-To: <20231218132830.5104-2-bagasdotme@gmail.com>
From: Ohad Ben Cohen <ohad@wizery.com>
Date: Mon, 18 Dec 2023 15:36:19 +0200
Message-ID: <CAK=WgbZ_HoaXgax4Cp97i6u8DAUzE1AA76tnUwLCVJ3dp7Y4ZA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Remove Ohad Ben-Cohen from hwspinlock subsystem
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux RPC <linux-remoteproc@vger.kernel.org>, Linux OMAP <linux-omap@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 3:29=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> Commit 62c46d55688894 ("MAINTAINERS: Removing Ohad from remoteproc/rpmsg
> maintenance") removes his MAINTAINERS entry in regards to remoteproc
> subsystem due to his inactivity (the last commit with his Signed-off-by
> is 99c429cb4e628e ("remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to
> export alias") which is authored in 2015 and his last LKML message prior
> to 62c46d55688894 was [1]).
>
> Remove also his MAINTAINERS entry for hwspinlock subsystem as there is
> no point of Cc'ing maintainers who never respond in a long time.
>
> [1]: https://lore.kernel.org/r/CAK=3DWgbbcyi36ef1-PV8VS=3DM6nFoQnFGUDWy6V=
7OCnkt0dDrtfg@mail.gmail.com/
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Acked-by: Ohad Ben Cohen <ohad@wizery.com>
