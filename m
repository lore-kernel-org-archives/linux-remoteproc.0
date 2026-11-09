Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210055;
	b=S4tKW0p7t3GlNcLjtxzPAd/wm8dmUuQyogOj1kbw7ZYyTLZQ6+LuF8g0dtACZxplvmXU
	 OG7SOcgwSlXTkcnlrfqIZVA1n6KaG8FPRSi8G5SKq6hxEm/ut7C1lxlD2ZbMnb5LbzNG5
	 soNTmHmrH+S52T/OnhuGWtwZEMOg2Tfty7Y766ICW9yhiXTVRlc6yxzY/i3NeOTDfYpOq
	 F7EuYu5xe5rfKe/Xt9Rb9auQFycNg85fIlAB1BjLtR6LgQkLxtK69wFNTmkGbrKiu3roX
	 aKqlcbDwm6945Y12lVRSOzQUWB6dfjVjWEvrPDUQ35kjpCZ/TmhqU71akW0NuScduBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
	b=xIblDETbdc/KcYf7ZAEHNYSu8xIjr0dyBUTQb27qvTRhd0Cu+qxm4AzLyYmmr0V2kPez
	 Pdwuk3F/R/7GreiVPRk5jJ50h1y4y8Ds913KG86BAz9ye6jw5Wy/9VhS7e/uAGlpKZ6GU
	 Ldys05unlN8ojo8GRSn9CjPDJPNr28N5B+u1yR4TjD0lqk0QFBjpm9LCX4fwXuYkgMKYT
	 0klX9fCGTZ6rYx945jN4Z9RgJY6m9a3wL0bmTdoLCDrhg/tw/6sYGvQnptrJbtGeoytDZ
	 Tdu6qdGQXAWvxmHhsAi2a66Xz9HYAJdtjKLu7rb+dNCFnPqoE256PTS9gqW6Qk6QE6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuqXFq0t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC5F606A321
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuqXFq0t
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso388993a91.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 08 Nov 2026 23:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210054; cv=none;
        d=google.com; s=arc-20260327;
        b=p3Q60zIRBD0WIWa3Mc7OQYwv26Ul4Ok0xmENzbzHNN/oNbClD6yo4kP5xwD/tgpIAB
         U9lcwYgzv/adqEcjFzVIGNu56BiKdxrMNA7MZKmXaRENj7DmFu9EewrWSb7AQniTfRHA
         7lvINv4KgzaZfF+cURNsahfHXzsJqZBBGJEiG9BC3NGXpGxoW121FAw/rUe71fUzGIbI
         OOn7WD/ic4PBZs4yjnFoaPvC9AP6U029zOympM2Qphaqqvks4VtcpwYsPifzcH9sBLgO
         wUEKMWWprkPl5QaUY0c5D5/nMVAgOie/esOHQPYAjzV7DKvf/issbesu2Ekreol0auUM
         llIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        fh=ArpbGjHDRANFKmnPD2a/sMdrd4dLNO46HEnZZ9fjKVA=;
        b=m4nfAp8zykJ2waJRuYxC7OOcE20ZN3fwW5aLwyDceRf8syCxCMNJuGsSpfcxsycIyE
         Llt6fJBz9Bj6MNhQPDSlMDavSt3KiXLWYWnHMLVJTio813PEKtnGpe66aGkeIUZU0+IT
         E4SBzEtWaoYASJB/oJVzxC8cnTsxSRz5k4abvY5/65vwQEno1EWV98eU0OmrSloEIdrM
         yGcTxGIZ/iAdqmFz0a9sBU+fGNeEbFd+eDi5qf+CSVpFLEIYO8jxHwBbutE4nxnQhYF9
         BiVAH6xhf9qEmBUlA91a4dsaOVn42lzrp+FaVWksV9a1227eIX9SYeCZRq/G9g7TayKK
         B5qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210054; x=1794814854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=kuqXFq0tTl5JQVuMi2oPKq/Rlo+gmj7lWPiwPYQ7RU+83hnncGZImbuWX+2j1noK1S
         YO7mm7+mxOQaPTMSvTaoDByvjD9/o4rBarbJnMoN3TAOC7z1J1aaVRPCEOZmbwO+PBN5
         yjQeWe7Qit4Umtbzq26wiM+XyaFrFUTNmZmai6VRQcgpKZ7tIoFJnyRAocmjeQCpeZS4
         icS5bPqGV0YNeT6sum++goPqNsDKZjjrWXF9cpnwp2bEMMVcQYdihaPW1mytY+ZdVpCh
         iTJIEgGClbzYZ+uhpfOz4rFLETxumDOZh5oeBDUFCSDEHcA5NQMYV1Idy/F4iYX/fLY6
         KtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210054; x=1794814854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=EYtk+EcS3CiAqIob3p+6m05JcRSVxO9puoEifqqSvmF5nJ0m/Z2tKxPY47yOMOpXva
         ougNKZA46xpmmsPReA+FMlKnUN8LmkTdK5gwj5ctfFFAf9oUhOfiuZB4gKBQgnlBTBQH
         0mFl0C0ri0Aij33i/Fh+lSPqBvhAqzHbQ6UXmv3sNr7Dlhh8cUhvObktOeDD/bgP72fN
         S9zEPwHLz7cdOOmzh5hhH55nWPqVkEbnR+6lzVloFk18QcBmCYpy8piquuz0ioCY4GJF
         8G2cuT8hch2d4QUDUQTAvDTQvATJsZgAll2FDxBGd+w8vqIR3mhDD8pHiGkMnq1M3f8q
         t7hA==
X-Forwarded-Encrypted: i=1; AL+hErHnvf3vKjfxROLF8fIiXhW6uIYfhYLy14nG7jl9cfJ826qjKVyYyMDCLyCK9qQFSGW9wSPCSMp4Euu7aFPlC94H@vger.kernel.org
X-Gm-Message-State: APuU4Z/IGBwbrmJemnaUXOEOfWT5zuQnCNpVB0dNE4hNpVzoWRgLYiQJ
	zPpsb3PjhvbnC+Vz+3eTvDw687qNeV18xDrTub7+NPzvPq8kL/8ZmPD+6KMY3t3oFzeI5MIomGE
	7pgs3hYzd9aBsZgBntmeMYH/sWSkw9ig=
X-Gm-Gg: AYBFou3Tk+vJVQ0EJtF7HPFMw5Y0HZzP/ZBcnJXn/pwQnfrtxoiz4P+pmjLMSmX8k/o
	NeWVqgsBOqh1E8fvSC+NlZuDfG1HsdNeblrMeOL2b1eQe0ci2GIDeFSV8Z9VePdLkXpGmiEM70A
	sZgbRQF/pQvHeftNdcGSjEdwNA53ge/jXcHkkTSxDF/8k5uXKRZzV3E9g1h1DWASVABC7nmbwss
	iGtlDv6xZg7tRxSuUWQNqlJuW4x6w0cazwuFpy5tlf6UksKr/jsLnfOQfowjg1zJpwFOZpv9e16
	lBOt8zUYAffc9GwHXiKSdjUqsbYypRmOEpfNnS1q+IxMW2fcySMElR+rY4LN2ZQ6FCBvwZuFJMh
	w4mmWf/ydR+EszZ6+0hSPRlLoBQtPCvBLSNyE
X-Received: by 2002:a17:90b:2692:b0:3ab:2737:3393 with SMTP id
 98e67ed59e1d1-3b12d4e59famr3159700a91.40.1794210054212; Sun, 08 Nov 2026
 23:40:54 -0800 (PST)
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
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com> <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
In-Reply-To: <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 15:40:22 +0800
X-Gm-Features: AclHuK_S-BK2XU0WY_pNWrUm4vSuurn5YOkC4y9TAw4Ztjpw5amiTRF4mk36wDg
Message-ID: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/11/2026 03:22, Shengjiu Wang wrote:
> > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The HiFi4 DSP provides a separate reset control for its debug logic.
> >>> Keep this reset deasserted so that an external debug agent can access
> >>> the DSP and perform debug operations.
> >>>
> >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> >>
> >> That's ABI break without explanation.
> >>
> >
> > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This serie=
s
> > adds the DSP node for the first time, so there should be no existing up=
stream
> > DT relying on this compatible without the reset properties.
>
> That does not change the fact that you break ABI, does it?
>

Yes, it changes the binding ABI. However, these reset controls are
required for the
 i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
incomplete without
 them. I will add this explanation to the commit message.

Best regards
Shengjiu Wang
