Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E63148D4
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912109; cv=none; b=Dv1vFo0ruWrKN1IM1ijcTkcY40LSqzy3BJeh7qdiaqIqFUMhxhQl4hPJdt8XgxErbnxzdDQM28k7MvtT/Fmz/nOAkAdmkhm2J69DA/cCtz7HqKsRQp9flayYULHYmzFa9jddA/ltdIzGJD1y60TlsI44QeLNp5Ez1FhKZGFAu6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912109; c=relaxed/simple;
	bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGrCjQoryGGzM0Yh5p+NFEXOhcgKIh4s9go8czwMxN2k3NP6I/wwSuzx6FQdcJTRvcAw6X9mMITV0S/4RjS4Th3iyU9YVZaS+oz8LkV0Qv5ycWHfUIYGsJpcG/S6ly9L+02TU593RW3TOgNcMBwMTf91ogR2tdbHANvDZVE3Zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=le96U6k7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="le96U6k7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61e8fdfd9b4so2272757a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756912106; x=1757516906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
        b=le96U6k79NkgVQa7/QcjlCjZi80ce7VQIrSBEgDupAk69tWX3uUW27C6NRN833BmM+
         q2XrP5cfRzC3Hw5RZoKwOK0Nfp982sdXyaaAQx4EEfyWPHgKbSyxQmWB7ydRRbhnLqGR
         7R52k6Jurt8hBO13HrFDPqiZY1+PNoKcwYxigAJuiKE9jeyWD9Rqj7RJMLtrfJLqwlud
         aBqVzh7fiPivYo0iVSVnNZlFu8AEnnL+cwuDHUIYS7lF6OMVSaW7t3wM9H9AXXNqi82X
         x4n0wRbl3lIaNUU+vAm+yUlNl7zGr5Y4ECSaSru3M9qT3H1VPh3q8CKUs8tdBCztDTLq
         mOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912106; x=1757516906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
        b=G4tBoOBR4xkDlWYW7PiYTHGrgz5E/IQ6VseuPMhmFiuyL7pTunDpryN+a/S+7CpQpL
         H5HF7c2u5cR+kt6iZC7f0IQizQP7ud9V2eQVeeVkxoCOQBOzRr8uI4PC6/H5nZ2vR8zd
         Iy+OcIQmMJvHrd7IBcrCHCZzAKhXOeNrDIUIV0GjzMNR/CP4Edt336bSuymKVkVNpnq2
         Haz1cVAJWhfBN1IZAdM/4wB/EvxLEp9rMoqzCv3lJvwIf4sIDjLDdARA0pn/Z2wHNiLs
         vhtiz9wkrHbpeaeDrx4tpWVk8SOMpD+2vrkKc2G2O88DrDiEqUsliX4ZuZHUwavKWqii
         gKiA==
X-Forwarded-Encrypted: i=1; AJvYcCXE8KEWHRPkQifvBOmmq8QpU98iie+DCZkoqmqXomQ9QOS3aIGsseuzjM+hBGkCS5jbnHq60VyBNJ3rqfZ3+mV+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh6om1iOAIlh3iNPQSL8q2EwXJLB4N0U7q5ROa7MbWVE58tTt0
	oZYLuoe7Extk+DAsiSp8uLvbxVB8Ge+48qlqWSFGF8W2O9IR4gyXVkZg/yddRasKQSdGM//Exgk
	37J6rUjeoQggkrl2VXa1FQm9KpyG/1uggDGb5XmLy3w==
X-Gm-Gg: ASbGncuPzwiprF61tkgXtPStKmMLNyn2Wj+msTnhKd42aFULVcyypenLO71IOB8RwE5
	+WmvGwd7pUuWXkXzdUwOT8m5isA8b8i9WHiEgrMMzfZuNdDP5UqFN0ii8s6qG+uejmAq1Q1v2i/
	On3rOABVGxnUUVubbGMC/JqBbH2G6Dl7dhG3xdIqw2YKH7N+6ZDookftvunvMW/muAvBv1GZJLC
	Nv6BhHW+Un5ISK7nvf0eHLUbsf5PmYFov+iV/a6uYdGhjDDEGNisj64XGnHXuSIRRspwfPuXtyG
	8w3bLy51+wUUfF5H
X-Google-Smtp-Source: AGHT+IFn7BWyhxyqlF2KcZUxCc0qBvV63/yqKBt2qJWo0WsCdrH2xfKlcteVT3gnPfYsWlvKxJ4MQhTpAo8e8ENe2Tc=
X-Received: by 2002:a05:6402:504b:b0:618:3521:6842 with SMTP id
 4fb4d7f45d1cf-61d26d9c52dmr14417866a12.16.1756912106252; Wed, 03 Sep 2025
 08:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
 <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
In-Reply-To: <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Sep 2025 09:08:14 -0600
X-Gm-Features: Ac12FXyQRSgi-B9_MD_FBGgX_7saidUAIRI9AwJxOjtr7PuEWmGlg5OZDn0enLY
Message-ID: <CANLsYkwE+6B_CgCJQdYF_n-XOH7AkDF_e2KTJnK4EtNtHRX__w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Sept 2025 at 01:20, Daniel Baluta <daniel.baluta@gmail.com> wrote=
:
>
> <snip>
>
> > >Please give detailed suggestions, but not a general comment.
> >
> >
> > @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset=
, do you
> > have thoughts on the latest feedback from Mathieu? Would you agree that
> > further simplification is needed, or is the current structure acceptabl=
e?=E2=80=9D
>
> Peng, please trim the message when replying so that you keep only
> relevant part of the text.
>
> I think you are both right here. I understand your frustration :)
> but also Mathieu's point of view is reasonable.
>
> For a person who doesn't know the internals of IMX remoteproc the code
> is a little
> bit hard to understand. Peng I've given you my R-b because even if the
> feels like
> it is getting complicated it is still manageable and you are the
> maintainer for it.
>
> Allow me a few days to see if we can simplify the logic.
>

Excellent.

> thanks,
> Daniel.
