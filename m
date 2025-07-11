Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04AB287247;
	Fri, 11 Jul 2025 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229225; cv=none; b=HOKW9vwf/prV02Gyoc8afzJTyQo4dk7fh99dieZ9Pp7w6rEm8VWEBsZhAttSeIIHm1G0gP9ZZr9M9ULpOMy2U16d67YECtUNQtW0VR7z3eVy7uj01A0ms5r+Qaj08Q8D2F8twhXbMpmjtjOLSOllL/7Ep8ui4PkHFFSToUX2a2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229225; c=relaxed/simple;
	bh=ZLLmIKtHD32BHKSjrmb27QgNt/hb6BAJ7uNG1ceFDyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apL5q2JetLZ+nDFSWsrF7AR3HZGPr5KdS5xtIUHCF+zdLivFLZfoZZrpMGZb0oM0VkDApsi1BO1+aK/OF29hUsrDyerKB3Bn8mrxg27YRAX1/cdCNO982ju3LN+Y2oo0OSoX380pwkQjoi0LgXgNabTA+NKUXUPu7izHayVI3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCy8PAN8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCy8PAN8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so2159065a91.2;
        Fri, 11 Jul 2025 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752229223; x=1752834023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=;
        b=RCy8PAN8n/XSAumLBqi8G1nGitoUjM7RQQKoKJTnNyIomBAk+t0GIY8uavUl5RImrj
         eBpo24O1ExRjz2izgfBOnXivsu068Vckp9ojCgEVcl8mF4C3DJR+OyFPFzcnFiQsP8in
         51E86//gYDfu0zBciPxuU/5y6kJ1+VDYkB8WWZVdJfjdD+SC8PY3+WGBmNNkBkeEjin8
         4NWRQx239humRXiLJ+efcl5Tp2GqyFgq21S/ztzk0VwohJHM3JMEuZSPeiSsSesE6mCm
         72jO9bc/DO4mExXW4kE/f3Ehhfqfj1yH/QXEC63MAFfvgKJcnXoayqq6iy8Tn2U7uxgu
         QJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229223; x=1752834023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=;
        b=j/hAclbLDjNXGJblLhreff9JG1HYuZX/7cM9YGbkKQPrwlJfYhhWinbmQvasfDvvkI
         wKxYA6DcLXBHldySpUQnd0snJrdjBQ72pMUSp5gNeSuDJDpfcjEWVrMtJNdJw4NEOLgT
         K54VzB8frduRtPvk3oXq+tTi37EXKMnYbSTpQVGoMfg1N92PACCHqdf3zBXdA7TtedgR
         W9tWZm3JzkpFU1fJ5DpayHhcN2mUDqUAJX6K4xVVfe0JNicX64OfIP8HpqeXkRa+AF7M
         5srMUQEUD5HQa8gxblLB09X1elhrDvfXl57/gqEppy94si7jcqGl6J5l9mBVZR54vEUe
         UZGg==
X-Forwarded-Encrypted: i=1; AJvYcCXhIeHBR4ulxm9Vs6+DY4slq0/UOirQ4jeZ+i2teSMcKYukRIhxTwzzBIX0NNOhB4W/jHEje047gnbnwGytozXIoQ==@vger.kernel.org, AJvYcCXrW1sZlko5DtTHPaKPN685gpWhb7EPGcp21zuPMs18Iz/8HBSFy4eVRfGZxyx2mgCnypBuS531xBB3Fe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRr7bB+vNUaSTlw+uORjBke+bc1uMLhNTSyTKqkuXdLR5J6Ahf
	m2gNu6wajaX70ffx2fdzk4qzHpHN5RhTdNmRpudYwLc3uetIkdbfDDfAmbAtTqkZeoVwQarZkF9
	rU3Q+qxcQ5sbzYKt3VKaM0j2Wpdpu9Tk=
X-Gm-Gg: ASbGncvaNZsiuUeg5Pg+VrMMepiC4aQdhZDsL/iDZTCeVJFopsHLlHpdKo+TDhMmgSE
	+xCG0I9uRTONwpPNzk0jjrHWUmpkqHuVa71Vbt9Meqwd7vaH8dAc9SL+7je+Y7ZxVq+Bf3ZLa1R
	eJkLfkDqz9+77i3kQsTBdULSOCxqS1mICTOZL2cO8NMwGlvatgbaYS5BHlAn9qpWnWBpvnStaP/
	T8V
X-Google-Smtp-Source: AGHT+IGcUF2IeFq5d6oOuNzBnemSIDWy3XN/AET4pna7uIiA0s1d9ETHya4xD6sh/N4FeyNQJ2PHRpWfbJp7eAqc7/0=
X-Received: by 2002:a17:90b:280c:b0:315:6f2b:ce5a with SMTP id
 98e67ed59e1d1-31c4f4ca9ccmr3107104a91.11.1752229223013; Fri, 11 Jul 2025
 03:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com> <aG_SosukEqUxrHvH@p14s>
In-Reply-To: <aG_SosukEqUxrHvH@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 11 Jul 2025 13:22:24 +0300
X-Gm-Features: Ac12FXz1oAWR7AzXrdUqZkykZa3V1NEpvtctgewTWRCMsKsQX5xRmXpD9W21dGo
Message-ID: <CAEnQRZB9r8-HqSJAJJc6iebZcen0CrpWL3n5YXPJOZr=-SZrqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, iuliana.prodan@nxp.com, daniel.baluta@nxp.com, 
	andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is a much better approach.  During my last review I said that I would not
> move forward with this work until Daniel or Iuliana provide their R-B and yet,
> they have not been added to the recipient list.

Thanks Mathieu, we will have a look at this asap.

We are part of imx@lists.linux.dev so we got the mail.
