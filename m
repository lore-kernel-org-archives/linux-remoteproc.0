Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A33D7D6A
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299920; cv=pass; b=qYPp7w+YgpkOJWju72kB3AVMh8kDIDw0Pordr1HP2pftdVMEMiwLNyv/jB6k31A3pSrSplz4uZAbG4Q4lBpqEeVQ+kuKV2gKZEB1ZrRAcAftL6L5Pe4RjCxY4Si8hBnnoLIjPLidX22nbU0fkoSaDhPqi8gd7g7DY+q9R/ALhJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299920; c=relaxed/simple;
	bh=Z6WbsAnp0/k5TRam8CoApQG5u2b0ang3JjfGRsR4/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5/b2SsPOAZlK7jRkT8IZsd2Myco4I9tvWGwza6JCRNX1GKeLN7U01oCTdMScH+jvm0nfY8y6PCJ4eyGKi6ZgPCeUsG9qD0ELMgr46N74BVuQrj69g+A9xOPC/2lVGmdc2WhgiTqNNFfb7WhFW+HbgLedjdZfwGmkscmLtwJGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vinJemxj; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vinJemxj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa5d092211so4909932a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Oct 2026 08:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=HeHXhmofSX7qdQu7p0ZTJsGwJKsX45J5Z0YUHdE9BaJOvzNgu0VTit++jGhFZ6D2X3
         hc3F4FMnCb1HPcmBLjaX1UifL0Qxp9O2QWL+IIBPsAd5QDigMeyFT37MsSguFak+P70Y
         02j93W/ISiRjG0VlmPLlnWRRBN6CnowbF3dw/F9Nc5tUlSWpyusaAoV0knvwA1Q7tiWE
         JBYPGLpuk3mmJlyEqdF9l1FlwyQWt2x6/20ogZatl12Xq5gmc4M4oSvPB4S+pHphdMgm
         c14cLXgXRGziu88tG2TZyyi7RQS/gjlQ5NTxYtu1l2TSd8Cp642iUxwcEkgwvEfqtsfG
         wpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=gr1q/N5d9f+yjxl1VcCer4WkBCrrsqTUTlIPyy/s0ts=;
        b=fYLVlZ2ywurrH9QA6IbbExE5kooCNYb4Yn2yLxGgWNWLYZQXDmXovv7lAg6UIGaHlR
         w7ytgQDmyBtIc4h79FeeXndRYqt+OQ7BVTyGJEHlVkd5QRgyUWVNgxAki9JNC8EeA+L2
         IrohpK5k/uvZyzTA5YPwejEvOoOqs64YncFMkda/NH9dt9VVi2mjvaPS4Bj98g/mxSk9
         dkrsN9HIUthgdKWK1X7AOlel+UTpZAu3hroUuAJ/3K45l2JDozUbHZHB7JDuCcbZiifz
         Stfrxmuxy/2xLSu9z+1UhkmzT6MICOQYJeDV2ZS7V6bXq7BvhtnrPHZrTjOI+dWL+hdr
         hw2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=vinJemxjfo0wtpRpFAgFolIEmK5h1JEjPQcX/AMCwCwhdtc+zvrWlULgduJ50Pr9VO
         xJX9/pmQZFWu0hcikEmrYOWlRLmLDMxRZuf60EZ+XAlxd8fuVz7tyIxfQcxqxTAOq021
         qh0RQqMV161mW7VccuYWu+k8wFFtFyKkK5sgM0yybLeW5h0iOBx/RmkZyTLDOY0segSM
         +24sbA92JaazYatCvTIfx3KBp2ZyoGvIwavOILBdB7oYuVHNCayu1x3d7J4dP02weV2z
         N99S/vtuJlv34K4IhkZSwh8a/JPfbU8CbQGg1p0CTAJLX0L4vsAGNozXrFWsb9OngU22
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=gOgZsnZsq9fTb36Cs2jTJWBIbq193X90Oe+weinYGhGZiA5ciEGgMvDYX9gJSidvK5
         xJR8JKyKH1878JQ1wmeR6clhPdKprjDOHMGPD+FfaU//kK2UME5cgeersh2ym88LHTUQ
         R55hvxrFdoSeZdbyzyCeJxqT1kD2lbhQjLIUyC1PMaX8gBG4LOAB9Kzh4ACQh7mExisj
         VLG9P3IbaB6FAuT0A20IS3adwha9FLlTMuzbJFp7HFRGLmxb4gM3cWCi3e0A9qAEY7JL
         epDwxoUMBhECYs1j5L4NxN7mncoVR0/8b2fZAUG6Ca/ppEcoiJtG9ttY/elGaz2m0sgf
         XXnw==
X-Forwarded-Encrypted: i=1; AKwUvBzgFm6sODHK8VnLXFARiMG7XMus0cYHG/OUrTe0c4CYubrgdM6UHnSLyblJjKXX17TM/Y1O79Au5q3ISWwOur29@vger.kernel.org
X-Gm-Message-State: AFq9FYLpQ30LUY0GbyY9mPnuvb9/arevzYt3XEWlrUSl77uXnmJieWx9
	vAc7Pj+dskFqCvb3lW61afjQhGoqF7ideREVBChn43OgGtfxZoeZwdji/p4RZ2/ji8XaQrNw8Pk
	MQ+vzSSGXGREWBsCvrvLPvQFnFykbklw2aHKNwRQoqA==
X-Gm-Gg: AYBFou1eS2oGzEvaj5EPSrsjpCKBhpU2c2cfqDpL56qzUMn9XB+EMmnVF+BRWTViHY3
	j0b1vP1u3Q/qb2Z8DWEzPpVSIAtJlSu6Gnh34SIriB5yinEYyxbzp95lS9Bi14U4ORKI7tBRI7v
	+oc7wBOhHFeGPIuU/5Np54EE2uuJVYLojGzm/sWYQMX0WVxyxbAXLDW5DKwlaFNGwENzHKo1I7X
	x6atrpnkkW8bQlUnwxzuzTjnXwi/9skjXCpvvXDahI0absT1FPlZiGXc07xq/eK8RazU98KAzgy
	HcKzvPw21Feht9Vx9nGaRc9BpTC4bzZU90iQ+rbj+JVmRY80VVxkKA==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob
