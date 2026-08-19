Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABBA49620
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 01:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787104157; cv=pass; b=A/xBXTKqZGxDX3tsNMWFGifKvCduUA/2nfPCHWfBvftHbW/v274KqgWDQcgaQap5jbkDtv1x1xb2MI8bCyWWKq56pAT6VeCX1rIrWFrFek5kcmwjOoiabhSX7/RvtOOEQiromr5BzbVGsevkcdmvOuVGNsFobjyb7bF/YAbY7qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787104157; c=relaxed/simple;
	bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+M2i0ypd4IXnV6t/1SFrWya0qD/kRuKHci84ZUU6zxFYjPDckbzVU+JcJeRmOsIywKdlvIGNcSAs4sKLZBnqA4VCD+x36ZsuaGeTUm/FV14cU3ttTkRzwlUiLsMOG4J7MAqS4kUoeJ2yvYu3F/6x5qzDdG+urw9AOaboSDogBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L778Xs2/; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L778Xs2/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso292759a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 18:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787104156; cv=none;
        d=google.com; s=arc-20260327;
        b=iAWK8dbry2zptQAQ2gv8X6XE+tdCkt0u2tnYNoGY91PhePuR0VbeKVnConw8uGLb68
         DbLbBU6LBrGVMiJvVtnhyi69FVIAUWu4QQeB2zwsb1f0Ie5YSnaw2pjmLNedr/yfHoH2
         z4jqZEL03Y+bcCrqBxST35gty1uC6Nb9PDQYJdcfQCSxlh9y4nVPDjS2m279Pg7jZYWP
         HAUaWOLdsgIUxYJ8j3CWJHXku32bxv9wLOJmbN5kQ/OG4sKdYnpio8ojdC7QFiim+8Ve
         YF1R8Q0BV9/R9i3txnh/RTEBjQOTwpSmxkZGJCXvCRudGGudZwEuXPL6l5wmlYJpRHG/
         tYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
        fh=qq1iXdg32xusg1+HlltUwtgjF/qfppz9Qt7GZvcZBMg=;
        b=KSQJuGt/OPDMvgcRzji+al4OTHiNq3+Sz9v8y/VFsNURtb07yOAQhNlf4BELADv14V
         uGYB7KYukQ7EJIY9ud3CNP/1/lLjc1h437D5uKoHo38u+KMlzBbqoMwu2mpv7DHIp7Ds
         fdmNnFZkOv0fibM+6P6gw5UCEqIDINSs6btnPeCBd2e4QzkVrWVfYEx8bmywI6AtTQJl
         Gd1j63tuXdrlx95nWmahl8OpGxXK+nHuQrBOgTcOS56/QV2BX52rQXlxq+u20v8gGein
         bmPP9jtthr8JA1BplhmxOLu0lmhs9OyaSn92mmnpZtd5mcMrNir6jB0bMOywJnx1RuWP
         tI1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787104156; x=1787708956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
        b=L778Xs2/18QmM4danwfE1Fr09NIxB/OnbhkEBtuQNpGIO9InQw/pfAPAi6kW61MXEI
         r6Frb7OAvsg/Se7a+LSsOuBBeKawcBanRTFO+iJx39SCRRM6H+CmpyK1oxV1fQD0sidU
         IdDLq9gQcimW0xt+R2CKHO4A12zYo0VgT3wnAb743vkwXMm9LgQtphUwjYPnHTMd9dAO
         xbcjvz9nbUjoa1Z7GT4joyrwOolyP3TEIfqcir3JO8ipDI1vYCewT8WVaTgRQYF5RDm+
         Zb0CYAyzxlkMF0Bf83BzPjQUv152/T6CRwSnhk12qz+IkPD7N2PgueoUHbyE9h7unxlh
         IVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787104156; x=1787708956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
        b=hkyl7GNoQvUmcDr7TREFLQ7dp+EabEdx/t/DYHyoNy2/YsGObmbfT7CHp6AHOudvfk
         ueXHPzP3yjqqTQ03y6vZ3arRnTMGUHkP5QRW3LC4NjftdEXB9CL8AylrXy8aZqsiFNYk
         s2Q+CnD3FIrfuMptLHsFYtp9lbwkLOqotRG7YatuIOVMNLjvNdi08hy10QwankTsOHYm
         2Lj1T0crz0b4wToIo7+rYQj4T69LTzQpZZSC7yRG2lwdgppwVzwixqAjdZekJ1KpOwTZ
         T8BAmU/79g60L13sXDlalRWTO3rmYQNDOBCtKurugVvY0prIfULPhSd5O0LTzp8Lx9zL
         33vA==
X-Forwarded-Encrypted: i=1; AHgh+Rov3JTLcig6m94ikS6/b+efAbpaGZhvB9zTQrttIOO1mTQnKWrDpI38CZaBVX9Y+JEydjDCR+go9TaHe8K6Pfbw@vger.kernel.org
X-Gm-Message-State: AOJu0YyNO1bOJkKOoxxU2sSPMorKHERiiKLUpd99UYfMJ5rEEfZW5Egk
	FDo+2dw5YqXvQXFErWu/9Vc8o8uY5/TOEnMFyHP53y3O7oJctVrlzyMSQEx0FKFcN+KApzWCXwD
	XCHu2wRhJ9R/MDwx17NhzjMTQoSrvgD0=
X-Gm-Gg: AR+sD13pp8zYD9g196R5ChLW+kZoKDjnm2gL38Lk2oI5QRMabearc62E+X4DuzpRplt
	iWT3VuirJga0Gb8bhhXoimss8r6sEIj6RV5gsjIOtYWfGMK+gppKqFKkrwj2gMmmBme9pQ6Sfwv
	Vn4iqgEPcvt6lkB85F815nyBhRsQafpluBkmOq/s8aTgNf1kNfBh1on4Sg8RwMHlXoKjTtd1/3w
	PfVCg8yK8jCYM21OxwPvd2+hbVQ+WMhxxKnf2YHcDFfMEvMFEAZ9cNgduw44Dbf+aXm8JXC1eLE
	foNUDc3Lwi1OOf92xCZjLBwhChmN6u7PT1XAeyw7KRYkSyHm5szH6SzU6/7Hwgaf8pkkJU/m/LK
	Eiy8N28icFSQDI36j4AV2ZXDmUw8ay46t7La+F0SMKZ5MKywMdDprWgtdYw==
X-Received: by 2002:a05:6a00:800b:b0:842:5b66:3c7f with SMTP id
 d2e1a72fcca58-851d34833efmr1727992b3a.0.1787104155623; Tue, 18 Aug 2026
 18:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com> <CANLsYkzHog8P=0Zxnn58zOQZP+RWiVpQxw3EDb4TkPdYxdYMfw@mail.gmail.com>
In-Reply-To: <CANLsYkzHog8P=0Zxnn58zOQZP+RWiVpQxw3EDb4TkPdYxdYMfw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 19 Aug 2026 08:49:03 +0700
X-Gm-Features: AcwNN1XjHhjsq3CyJYZRBObuebJ_W_zahDjaumAJnsanqgsHQwQ0aPe7CapvWAQ
Message-ID: <CAABR9nF07sH0m+G8ZLP9OsZxmJgUVA2==s-FUQa_GNfiuObayQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: stm32_rproc: Propagate errors from optional
 IRQ lookup
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-remoteproc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thank you for your feedback.

>
> I'll pick this up when rc1 comes out.
>

Thanks, I=E2=80=99ll wait for rc1.

Best regards,
Phuc
