Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971B282F4
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Sep 2024 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727207586; cv=none; b=Yid+xvnDmAAGs0iBC+bo8wDlwwxpt1p+tY4aL39l0WWgW9Pi2w6FHgXGDR4n3k8nKzS4fKLzhSKw1ao0gHfdv3kY/s9vPpKU+0TH7ac2AWzxN1Wrb5wEYPrbiymh3tot+o7/aEJHUwpEyBRbOk+ZHXmwEb+ZcgbpYyJl2qqYQTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727207586; c=relaxed/simple;
	bh=KT8rvM77L2IbGpejE79KBgEP4qmqCVvvennzSDIi2pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NE9Ked130DOeFbYw1l+c8dy/DxtG25QsmsDH2VeCn0mvFefvtqyBk2/rXXWuCCLVVXto81L4m6BWvTF+Fm1JtBYY3bpNACL2QYsG3QYTf4Pa16z6AH2MjFzuJrs8Mc7fm0z+FTwrJxk1puAcvLX9cKvC6JYZ0A7p9THneLv9Scg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I9tL5Akg; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I9tL5Akg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f753375394so43404121fa.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Sep 2024 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727207582; x=1727812382; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=947KiTDRASLjIeg3socCB022+DS5zCO6A8y2gr+pDQw=;
        b=I9tL5AkgWWoxq/Y3LL0QUeJRmIWpKBCVfJHLnkyQOogIQHUtQcrJCOM+DKvzsY0Qdr
         Ukd03jfVpT8/0G+nK20uIn76EIdv0+kXutJpOfVejlvejK9IhOrFkWGTLxPGnUJ7tPCt
         /zYzP2ilp7fz+YLzajUN9idpRyJ3cRaobSz/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727207582; x=1727812382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=947KiTDRASLjIeg3socCB022+DS5zCO6A8y2gr+pDQw=;
        b=kJv+MCcy9BqS7w9TpFvrpugLsEfkToBRswX1IneT8aSTk59ND9cYFsoMqeZppsobRA
         5PWjQta/vVQMs+ZP+HihOvBMzNAhyuZGSSmy1xzpstSOwwi13H4xgjNgqWwsSgA+NHjg
         jsvzjM7tzJSr9dB56S6WB0QrIkCnQWGrx0+ik7SwV1HhlA5TdTOB4irj++icPHlTC3St
         cCb3mCPBKSXDi7OGD0m5jCrx+biU6k07rXy8eVeXjQffgADVAxmLuN6Ii/oMH6WY1vYQ
         x+2qux4Fa0z01gMZipx6TJrkzyynAQaSG/xknS9uxtT4HSfP51uRlpGaXSAr2J1+CzU4
         UPbA==
X-Gm-Message-State: AOJu0YwSn8/3tVVGOQ19bjxl83PmGNXGcq+aZwNBZzYhZAM2+lqIX9Je
	5V11BrMmiJlNMHZPbNXX++8tsHjqsvbpEH/qKBWboeIDH2l73+oHlPJ9VrZzizhyIP8RU2GjnvP
	ezTQfVg==
X-Google-Smtp-Source: AGHT+IHKrwCygIN0uc2lg0eHZerOHW1L+YcumaWtHLRrNmIm+BAxGuelkAZMM9TrJNkBqS1Qz9OMRw==
X-Received: by 2002:a05:651c:2128:b0:2f8:d537:2846 with SMTP id 38308e7fff4ca-2f915fdf844mr3427521fa.13.1727207582165;
        Tue, 24 Sep 2024 12:53:02 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289b614sm3006301fa.108.2024.09.24.12.52.59
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 12:53:00 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5356bb55224so8077370e87.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Sep 2024 12:52:59 -0700 (PDT)
X-Received: by 2002:a05:6512:b92:b0:535:674a:2c18 with SMTP id
 2adb3069b0e04-53877530ef6mr121416e87.32.1727207579451; Tue, 24 Sep 2024
 12:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924044741.3078097-1-andersson@kernel.org> <CAHk-=wieXpmx=+gEuhQSEEZLyQHFLDk5=59j0OtOF==mQdVjYA@mail.gmail.com>
In-Reply-To: <CAHk-=wieXpmx=+gEuhQSEEZLyQHFLDk5=59j0OtOF==mQdVjYA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Sep 2024 12:52:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMBWsDkuQvZYfLj=rvQDnN4rdseS-LkR_VwD+xzvjjiA@mail.gmail.com>
Message-ID: <CAHk-=wgMBWsDkuQvZYfLj=rvQDnN4rdseS-LkR_VwD+xzvjjiA@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v6.12
To: Bjorn Andersson <andersson@kernel.org>, Martyn Welch <martyn.welch@collabora.com>, 
	Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Beleswar Padhi <b-padhi@ti.com>, Zhang Zekun <zhangzekun11@huawei.com>, 
	Naina Mehta <quic_nainmeht@quicinc.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Udit Kumar <u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 12:31, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It's in my tree now, but please fix asap.

Argh, now that I noticed it, I can no longer unsee it.

So I did this

-       depends on ARCH_K3 || COMPILE_TEST
+       depends on ARCH_OMAP2PLUS || ARCH_K3

to the TI_K3_M4_REMOTEPROC entry so that it wouldn't try to select
OMAP2PLUS_MBOX in conditions where it isn't valid.

                Linus
