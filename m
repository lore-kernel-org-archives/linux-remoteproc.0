Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265951E1C13
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Oct 2024 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728497344; cv=none; b=DEkS0Z28MpxphoL/cm0QmFC6W5/mIKbrbxG01HbnG16sDjk5vfs+iTSYYaW70MEep6uqsAbniEMaZqZ5axFLlO7d/yuPWQ8ppQmjosPZuNQ1yfNI9v2g63KsyhloSli1W2sz7mt/0NbkBQo5KvMb9htfX6uJBM0UKwFyJnt6sXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728497344; c=relaxed/simple;
	bh=aJTtulUnlkRq2sI8ySHzYkE0tYPtx4y4/j6e6KligUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKJ7fEUWcC8ppHxScV0S90q55zSlpukgBLgIAWHCJOPq2mXW7i0qOizT2qHfbE/4iyJUQHuO6a9dvAeiL4FPVL1gYLh+alsdTZ9ZiaOXjg7KANfOGqWP3lD4+Fk8XfWMwYm94dbrnNAP8bLu/dG6KrK3U/kU73Eg+FGypU4UPDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=utuSNZoo reason="signature verification failed"; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="utuSNZoo"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c91a7141b8so1760810a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Oct 2024 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728497341; x=1729102141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO6EoSor9lmUSKV+3Z+tdGRLdha9xvjiiLQgbjwM1gE=;
        b=utuSNZooxokaaFSdymkzA3uj4FUqFknWbCDxjGPowFqyhjfAIKjeaXHUqQZSen9UsY
         jzXedJ3VNaWezyYLcaeSI5xOagCqj70H1G3W3Ef7G+080tA7VQd0O4TGtRfaGoF5SZHa
         ZxIl5j0VpxdYNKE1ddl5/+Yw67rurfQQaEp0NS6GkPjMPCiCbGIHolgBEBQ6kVMkno3t
         /T4mG4WGYnsyhH7GiB8E/58MO/YuMN/jcxWjWskdK4Ni4D8rUJ4wurX6Weo/IoMaU2UI
         /SuNdkZV98O9u1cHMxdWkvd1TznMBed4vR0PrRInWv5URgNiLcu5HnZnMTGZ5CFL2oui
         /muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728497341; x=1729102141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JO6EoSor9lmUSKV+3Z+tdGRLdha9xvjiiLQgbjwM1gE=;
        b=BrfSL0tZ03gKfLbwf/DFdjbI2lDju63880BODX2epd1tzMSM4o8k71qn5Kq65sg+4M
         MrhmEqdjAZSPtg4GRi/XktMOSQuhMBsIgcfZm/qXqZy1Pyqs+g5aHWQO8ytB26v0OxrY
         zJa1xRoyxrL97oFmnu6+llI8KxhGqGAWGeoWk7LN3MF1CK7IesFnHTlNbU4U82guI82x
         +WJ7wSbizPvm3wC/8HH5hsH8ZmoHjHUbaUlX/QKQZBFnN30DdZhJasZtq7maeBTbcayA
         8t0PBI1PxtmrrkggloxnkfKkm2xwrRNRPwlEB/Q7cVrB5MlGvPtMgZUipbt0IH3UheMf
         hfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWjGOfENV89Vj1MMVnQVHwIf9fu1iwkvgM6gO3xL1Pmhpy/XnpTW7nPZDFZx7rYqZV1ggXlRIMTGkDGejw31vC+@vger.kernel.org
X-Gm-Message-State: AOJu0YyeFSX1cja0EcP01EdirXE0m9u/9drThWCJBkhuDqeEryB1jqDp
	9+h4cf1xBCOyMk7n95w1acJPS0tSPe7gaNxt2riObheEHWMCi6PeofRAopsQWjXFlAamW9iCsG7
	0U1hwB2tk68+TZ8LsMq5yLImxMQWjP7qrd1z7YQ==
X-Google-Smtp-Source: AGHT+IFAGQFdq9yD9qsAynELVksZGAxjXUQUXG4JzrvYS7sgNSRjidBrHY7zboQK2G2Fhi2wJG2fYfR31JcBK1QafZQ=
X-Received: by 2002:a05:6402:3594:b0:5c4:1437:4159 with SMTP id
 4fb4d7f45d1cf-5c91d675554mr2986701a12.28.1728497341514; Wed, 09 Oct 2024
 11:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008071559.18523-1-everestkc@everestkc.com.np>
 <ZwanGrWs3PI4X7OZ@p14s> <CAEO-vhFFHXeHH961e8KMYrwyUHtGCZmPOP9VC7QrhpabH2wP5A@mail.gmail.com>
 <87v7y19mmk.fsf@trenco.lwn.net>
In-Reply-To: <87v7y19mmk.fsf@trenco.lwn.net>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 9 Oct 2024 12:08:50 -0600
Message-ID: <CAEO-vhFrEopCh+qUmueOOqwC0MWW6dLeqJP7mTNXJ_sY3GrHGw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: Fix spelling error in remoteproc.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, andersson@kernel.org, 
	skhan@linuxfoundation.org, linux-remoteproc@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:06=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> "Everest K.C." <everestkc@everestkc.com.np> writes:
>
> > On Wed, Oct 9, 2024 at 9:54=E2=80=AFAM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> >>
> >> Good morning,
> >>
> >> This is a case of old english vs. new english.  Using "implementors" i=
s still
> >> correct.  Moreover, there are 33 instances of the word "implementor" i=
n the
> >> kernel tree.  Unless there is an effor to change all occurences I will=
 not move
> >> forward with this patch.
> > I can work on changing all 33 instances of the word "implementor".
> > Should I create a patchset for it ?
>
> Honestly, given that "implementor" is correct, this really doesn't seem
> like it is worth the effort and churn.
Noted.
> jon

With Regards,
Everest K.C.
