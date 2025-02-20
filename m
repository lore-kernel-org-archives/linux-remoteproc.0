Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B201C6FE9;
	Thu, 20 Feb 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048727; cv=none; b=ALmocbgAYtdcTHpBBLzDpL3p/QoQZ0pPZCBP8PZu2jKMKJUgbOVaLCjTCmxdCeF/4jVEYu7/HDA+dk7CalKaXxICEGASnZuwwcrMgR5gApw0WFkP+eAgZOfqrTwNVdodRqLLP6B9ttl++8Y4cWom2vMrwyQopdHsH2PJAKqEsgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048727; c=relaxed/simple;
	bh=Hj8rjbo/gVN/i8pFWBGBMOAQRZnmKNy8TUBNnlxGBuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMZ3ZDw2Fbj30c5xqbxJEhWw0wxOtaEMCcGXPaL1D7EOsd7z9LBHIoFcZpegiXpQBRZpyvt0GYXKge077noW/JsFt/8+SmBb8BW+uQInIxO5rVlIN840K36+GzSyJoObYYKRZjbw6B0FGoP4K2k0IzK8nfJNNu3ryUSdma4XWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN026PoY; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN026PoY"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6fb9dae0125so6498757b3.1;
        Thu, 20 Feb 2025 02:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740048725; x=1740653525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hj8rjbo/gVN/i8pFWBGBMOAQRZnmKNy8TUBNnlxGBuo=;
        b=PN026PoYVFq2tSUMqaJWMEiElJt0LnqGpmwmYXconyXxRBNaam5ZndYeoRdETU07SJ
         gcrdy9mX96Ygs4fFUw4DRdpTIoEAI56Z/i1R4IxarIKkRdHhlGtUepZRZlLW3U3dG+IN
         peIcg0hxBCG2Iu++fipG1kgveAjEapW4NTaI/uoCqk6NY/E8jMw2+rQc8USRRl0uvFU7
         NoJ0n4/fOf4RFiVzJsc7h8DSvimUJMtzMJ+mNcYP4J1NX/0AY49/OGGJuyxP2Z6oK3Q0
         PkrLrsaVB8Vdcdavnd9qpI1Oo7wH3+09Pz7Pxf2dTcfkNN2BbAxSWkJaevMy7tBXtoYe
         UXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048725; x=1740653525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj8rjbo/gVN/i8pFWBGBMOAQRZnmKNy8TUBNnlxGBuo=;
        b=EzqT47C9GuBqz+myzcsJaVJ0stsMZuv8nE17Qz0gRLlY7VT0HOKow81MVJpzMD6y+C
         hlICs75RrvU+0w38HPOwjkrNKrdf6tw0jmb8nehU5YI+Q3KB1oHaRiu3mENGdPC1b8t3
         VnlIs7aTGHVByK+X7U4yD1b+WJjV9gvVO2tC7INEk4NZMEqFmGnB0Vb5YTwZI0OCbL7b
         nsIVSuz8k97I8XFEqUcbJHKNzV4rGpD7i6olzfuPq01/w2TUibZ2gFOG2VIaM7IENU0H
         zLhtXFVfl2nRyXJoh5OppUQdYYld1bPR0YlT2O2feRPtwgaRvriVphvu91Btg0pgwPaS
         i4LA==
X-Forwarded-Encrypted: i=1; AJvYcCUgb96cKkB6+/GUoYgXJi5v6N1hhy9zPJYL1js2A0Xy4Eu0QkzNUPr6I9nNp76CxX275jDKQ/qcMdCvlOc=@vger.kernel.org, AJvYcCWMr6ipfgGN9Ast0e4cSr/C3jmdN71cpoRhwu4xpPf/b6SKug2yD0TgzjOvPKrXSJK3mWUPOPTJAfdZIb4ebuO32A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjFYqQTqeGghAjnH+H0MpB7afrYlEM0K6afmkih7PEsGS5w+N
	pIZR7QN2i/MsISqhLaGdg+hEFKQklusXnVwwCNQj9xkyD4Oxz87WLkz32DH+eDdZtBe4RPubpqt
	YDCU95JeLCD8kX+AiV0Ea9V6Y0STKBS1nqVk=
X-Gm-Gg: ASbGncuuyDJ171UkCJMC8aqhTi5AUBGA5uNyXFNSa+RCjgWrgCrvYaGkmIeI2sTkAkI
	rKD9JrPBYXmDnSNmYCgKnHr/qf2+DzM6pq4apBWxv2lN1e/fk50uUNtG3d19AW37RgA3gPU6lYg
	==
X-Google-Smtp-Source: AGHT+IF9+aS+ynBE5ue2zge/OhE/pa8hemMC3oWG6WvPFWkiUbJGQkTTOSAQWmSslbYENvfTgEdMM9Pf2lXBJvLmJdo=
X-Received: by 2002:a05:690c:fcf:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6fba53693ddmr68921587b3.0.1740048724665; Thu, 20 Feb 2025
 02:52:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218161352.269237-1-simeddon@gmail.com> <20250218211200.GA991534-robh@kernel.org>
In-Reply-To: <20250218211200.GA991534-robh@kernel.org>
From: Siddharth Menon <simeddon@gmail.com>
Date: Thu, 20 Feb 2025 16:21:28 +0530
X-Gm-Features: AWEUYZnvxPMzu2JSXYZi9-VDvGcvoVv0K_ixyoZ1-_UtcfPD29hExXVJsI4K0qk
Message-ID: <CAGd6pzMLQary4PYHN_7vc4xoS3SiAs_Rva+HymcXi_OFoGSakw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwlock: Convert to dtschema
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, andersson@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 02:42, Rob Herring <robh@kernel.org> wrote:
>
> The consumer side lives in dtschema already. Please add the provider
> side there too. Patches to devicetree-spec@vger.kernel.org or GH PR are
> fine.

Thank you and Krzysztof for the feedback, I shall address the issues in the
next patch set.

> For the descriptions, you'll need to relicense the text in hwlock.txt to
> dual GPL/BSD. You will need TI's permission for that.

Regarding the relicensing, should I first submit a patch to relicense
the hwlock.txt
binding, then follow up with a patch to replace it with the YAML file
and correct
incorrect paths?

Regards,
Siddharth Menon
