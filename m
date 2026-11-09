Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794222118;
	b=Lif4OJPmz4wKFltKgtXrYUZDNxVgJ6Ty13tvc62tfNnZDg2pFVR2YHNgPlAf5O08kWtA
	 BYibK5Kx0V3QEOxF/+hZOCNLkNYJMu8+HwRFYiL2rI3rVHn0NognLRvKOrg4jMFIGUacX
	 D9F8Od2jz2J2jVh+MDjfARieYPLpjbSFiZvJmTSczMe9rXnSvGd2zZo9LZA1HxSP9LsEJ
	 5cRyaOqJERMdKyILbGDH484Iy0L65W9ZaoYLS6YhlaVLlIMI/S1X6aV0TxeKRhzCFKMlF
	 740j8e4VDxD+3VCwEi7A8lU3pDgc5pie6W4ZdbKqGy/M1wMQVZWPT/kyLDdmL8uvqXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
	b=Tmu0xfkkNWqVs5yUXDN21JkLAx8Fygb6OSPaUanVQlC3/cG4KbdJHY6yB0qDcxKKBAZf
	 gyS8o3eaUHlZSOra8+IgsiAnbXmivMX9PEE30ffRGXqcUuus9Xr7psfMHJdNnoFw/M7Ew
	 ZtjdvWwNBjG9Hqf9qGgy0MwzzBb10Dj+3iEPqPoD68Pva56RggIaJyF0W4Byy3g5rnB78
	 AcZc/dmtc8JlrP86YJSIXpfNy7b7HqSYkTSnF0hFOiIw/GqCi9nG+a6i11ZLIl+727E6Z
	 R+8ZBSWFWdWn5Lm8wP7HfoFOCi2PeyTor20HQ1rzbQhxhxnpJP5RBCvYZFr3iYrqlmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz0aakdO;
	arc=fail smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C5606A323
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 11:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz0aakdO
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so375772b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 03:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222117; cv=none;
        d=google.com; s=arc-20260327;
        b=TGopdY5iiI6aC1Dy++bHO2diJADLZOI2tlZbOJc1L6vA43FpUvWETDecxIYZz+0J41
         gcgIZJHoVJMZt7tLSB2XsnW5nlWlTOc2ZU64mPLrB1PYD680u7Gci4ptKd3j1cbkwaPS
         W5ScKYQxQpMsxsyIwijHtKdHmI5x2OzRNrlj0volpdKW4I5llQNWmb4c2OhzMQNBFUG5
         10YNi2VyGnJKeUu6B7Y7ltgUcQQ5Q4+BP7ysEj74LE52zzXvZv7KUzWbgmvhgEF4AmpC
         QLM7g8j2eqlGTgAlSOi72NcBx9Cdk5rRCHPsAYbzwUllv49BgNCn3uat88VkmzDTMU41
         gJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        fh=C5DfO22iVktfeu7vbOpPo9y5U9K8Sonss/RasliSn98=;
        b=NVxwtWfH61YAC9STkmrPFAXEtqGJE+vBmHTOVUqiNhdXNScmHM+FcHRfMrtuiS2j3m
         nh4lE8A3iIXJxdM9MkOXQeJJg8fDygnlNxPP1+M3QijPEaab8624e94JJrLIRhoGGEdE
         As2dZV1ihqrUZgrXtOBMGzgLOA50Ab67a1SXulRQpD3sxFH1xBif8L8swY3Dc8xK7Rke
         azP7ZVY1bnHHQCsmWgRwTe1ke20ZQMZYTXUa8uj45A1TFvGBuxQgifD0Rmjlf1Venuhd
         MfETSJ/rO6G13Vle6lb0YwTniXVSGPJHyPCCWQRAA7A5I/4ArSc9JGVN3oofJcddHNyn
         MwXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222117; x=1794826917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=Qz0aakdOjLfz4kVdVmKCIVf3uozBAYOxMMfTdisyhalGjGpAUbIE5nIDFlTaneqlQa
         JnyRSEBugy+xfC1TYsOhfPVBxgON4rte2A69iGCEWmrd3k6dUbCpHMJr66o+9kwqPHGy
         fJzTLeOw3BRnqaEWozIgxOYxkS/naax96d3bteA4lZ3aOVUTkeKKt2zVY8+Btpl+ulhT
         UzismSBemMwcnru7vTkmp1bf+KnjcGfw/8HpaZtGjHtvShnA6UwwiR2gBG/3AtyGMUeG
         KArnIjEulOj/BboUkGMtkfY/lyXsPrRvsjRpkIFZmctJcPoQAck0ZCcMDIFzJD8Yp9Wb
         5nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222117; x=1794826917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=n9rWxB2nWYUf/QiVFtZAF86mH1cmV/GRpOQTzq63+YS/23fc13bpNe0y9T1OuShDUc
         jHpdntIzQuHmSEs9HNrWdmoz41fC1mhIVHrF5+MSKw53UFx83Z5V2CGvedguRzTWedHe
         nOCvm/k9Av5YjyMaLDjwEEV/AqZq7FMDl6KV43I/HnODQmT+Wiyvh61Iw6d4yKZLEY37
         IL3AjGYC3MJ6cC0iDx4bV+DrDVHYdoXayhJtdathWZa6B8pnLl19JH6VByavwCISNZqD
         BPRtsA5ey2igVMhXA0EmK15w4/GXGL5z3e2vo9gPMbsBkKkkN1y+r5awOdN9Ep3LF+sq
         1Pvw==
X-Forwarded-Encrypted: i=1; AL+hErGrdW9jy9xqIDtTKg9TG6irTK2Pe2NSn53Xadwro0JTqz8g/T3rEpGPHI+XsuQ17v6QwK6XgB0q0GXCLv5Wjk0p@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jn8WhLlK6Uli36+oaDrmSIhIZ81MhO3hoiMJ6sZl1eL0+Vcq6
	ygLm82y+iYrEbb06XralJet/qgvkke2vpuidqf6A/V5n3KxISLlReqw9oWIRgyo8sdPF+PyYSja
	ReMmPOA5KQE4zy8vzbf7j2BwMUlwHvas=
X-Gm-Gg: AYBFou3qASgd07zD0mMhJmiE4ROAbigGznCJn01Rec/OhZFhIkIjGIuS4VF3On9BkFS
	bTmI56xMIJNAYT4x6TgV+WigcATJO0+ZjD0JiLfI+wV96zceaTkoZoC8VYZSGWh461lgHHP69Wt
	6fL6vQ4dhU4kQLCjrM/cHfOT5FM+4xJ5ERW9jVGBiwffx720JFwcBl/Spz4KK3uNCvc1XtbAlhh
	OK1A2gfTWe0ZsmJ5T5vmLD2MnIiRF0MbffkddE4m35uK/dYbsw26sntk2hy/e54EYELsuT33Z5Z
	/YRXrebkunLKGHaJjffD3S+EPn0Vi4jal4D4HKy4uzKPU4+my+t263KJ+cZnObt4JIHxtJtbtaB
	jI7IL+vdVb2NRaFvZ/LanLLJtcfA4IM7uXupdqQ==
X-Received: by 2002:a05:6a00:3c8f:b0:882:d8c4:17c9 with SMTP id
 d2e1a72fcca58-8b66e343903mr3314714b3a.23.1794222116824; Mon, 09 Nov 2026
 03:01:56 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
 <80990ab6-5072-43a2-b829-177c956080c6@kernel.org> <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
In-Reply-To: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 19:01:45 +0800
X-Gm-Features: AclHuK-vLDzqpNnq7WjP_EKkxW9CPBRL2HdSB_SqKuNRWnq2UdqsNh8iwWDBhD4
Message-ID: <CAA+D8APyfdLR8cvq3GMuF9UdQ5yM6LNSwwuvt+7rYaMFPk1Y8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:40=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 09/11/2026 03:22, Shengjiu Wang wrote:
> > > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com =
wrote:
> > >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>
> > >>> The HiFi4 DSP provides a separate reset control for its debug logic=
.
> > >>> Keep this reset deasserted so that an external debug agent can acce=
ss
> > >>> the DSP and perform debug operations.
> > >>>
> > >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> > >>
> > >> That's ABI break without explanation.
> > >>
> > >
> > > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This ser=
ies
> > > adds the DSP node for the first time, so there should be no existing =
upstream
> > > DT relying on this compatible without the reset properties.
> >
> > That does not change the fact that you break ABI, does it?
> >
>
> Yes, it changes the binding ABI. However, these reset controls are
> required for the
>  i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
> incomplete without
>  them. I will add this explanation to the commit message.
>

I also think it would be better to split the i.MX8ULP reset requirement
into a separate patch. Does that make sense to you?

Best regards
Shengjiu Wang
