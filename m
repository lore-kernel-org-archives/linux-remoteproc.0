Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34647252C
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844986; cv=none; b=fQLWysOazwSwpWldT+LDZgiX2qsX0vSb2CtZikSWLxrimvqXQ/9eenF5cti2o0BRm3lxGeiLtyd7CCi+Y2Ge8ITtBJIaPMCGq89C9jAYP4R07nZUi/VnSoAd6SZOlJhVTPPRKTUSKC9rC3XYSyWmT39z9kQ5ThOIgO2Ad9NQ1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844986; c=relaxed/simple;
	bh=IXit39jokJOkDKdV9ozjAq5puFGqOrTpsC39d5ly7YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZO9oKTpHhp7VFpoA14Omfqgp2RiJfKcUk1oTxCW8mT0Rp97mpd5F8hviQoX9mTyhoG1U8j0YPpcOide0eZazM9GnBKztNORJ+/B+hJfa8d84C3pYiInhr5kw7hr+A+Ko+tSmayl2286kLmdouGHQk8/GEoTK0hIurM70OjCnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndE2+w2+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndE2+w2+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so138823a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844984; x=1788449784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=ndE2+w2++9Cg8O4juXiYVelRJmQ8+HFiDcLp7iuv2/g7qeuZ7eILSSdAxdPszUz7Ru
         2wdqKVTcdG4fFxooYcxMwvcd48PmQYg9OnSktXlAtGgzXVuWhF7323RDH/BceKPxVGl9
         HZxfOc3C1ZZ584so24PKu3406w1E3Chggu+jPmz8dhJcJqcHPIcCJLC2HWvVoFcbxNq7
         6BcamcvNRXPIyXosEwaDEpEEAfjtdzd2gDDajE53qYvQeB46xQJIPmae0qfhglOxForA
         RZ6ubRz/zBjMWcj8WQKKz2h7UFeLPdh2FPgTU2Aig03NFM8CrzTHhUBSci1vLGA7tU4+
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844984; x=1788449784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=SldEowyCCtMcotYDRYXiB/otZrZNkYqxoGCVRrxVvZud6t3SwKVYQTM7oVDOOP49K0
         qqBt+LV1WK0SotqdrHAObB0QnCGNoKU2ApMufAqp3EfxysBNRzWhQ9IIng/eGNMS3H21
         ixCSPKzoojWy5zuBOquE3705fKcXAlYtrnZ8j9wcebGNewIpqF/dm0ujw+JMFb1Zv+8r
         7rRK3RAN2yyDOh1eMqiuEOYI734Kmeljd+Vq5Gm1OkZmyOhEyuYsh/9qOYxBquneocfz
         jFlNK3eMtDeopAq20KWukI3zUfsym3dMq90sTs1y9TVbPZ5CitPpqZMjHFLz8NE18KrP
         4MNA==
X-Forwarded-Encrypted: i=1; AHgh+Rro7GRPzFX4eWAU4prcWZpV3gTfcH/U3dLhjWZAtS+Slya+w+NYk2kZz4oEHqfNlUZBVJmRvMSZ8EghPKx3/VsV@vger.kernel.org
X-Gm-Message-State: AFuF++mEbFwJ44VeHJShNZ+jlc79UVqDgD4dJawOQU6O6rvevVyaui94
	Hll2uSRWufPrV4kO7HBWQrrNdThAv+pGiircqNVpqg+OKgV4cHH5oW6Q/xwUNlBp2Yc=
X-Gm-Gg: AR+sD11QPpF5DxO6L6TtCGDo2VRd688hpjNN90G8CFdVNBuD28HQC0gW9kKeD2i1bpw
	xm5dbrq22CnxZHnA8dysYnyX8a+aYvfaOo2LZl8TZFmd8yfb1unOuwGPgV+YvZX3+TFjamdvSY3
	3TvRb+MXVF2Fm5SYEkE+g9IlXD0vlKsplXWiVgZ2zetUSavF1+Y2B4Tby+aZYIjBklcFEtIJsMx
	IyWIX23taQmIgcyGpDrtnwLZm6wcJvAXsL9FGhHqW83jamUrPzAvh7AvxwKXMjX5zTp6gcmYwuk
	B0zRBLsnbqx/hmW2hwpCDX6CvvpOa1Wfp84zpxWb93FWdoyBDZGrKKhcEHbnYHFfEnbpWb5Ad3E
	YzEQrlfp5ZYBiV7+EUckKek7XIlBxqN5rk6BHum2EGfJI4YAKbA4Ft1QNu47HS0gx64zHb36oeT
	UechejMZZi158DS1HBPirw8hQhxxGR4zL0aMWmg1WWBF2CjFNRgs0QpZ/4cyHFGnDN
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr169425a91.4.1787844984074;
        Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:887f:45b3:fb30:8d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm3187307a91.8.2026.08.27.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:36:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apBZdNozfoCUp515@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>

On Wed, Aug 26, 2026 at 06:36:54PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> 
> NXP Public
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, August 24, 2026 9:39 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +        };
> >
> > As I (and Arnaud) have stated before, I don't think this is the best way to lay out
> > bindings for rpmsg-gpio nodes.  I am currently thinking about a representation
> > that aligns better with other virtio devices.
> >
> 
> Hi Mathieu,
> 
> Would you prefer that I wait until you finalize the layout before submitting the next version?
>

Let's wait until the DT format if is finalised.
 
> Shenwei
> 
> > > +      };
> > >      };
> > >  ...
> > > --
> > > 2.43.0
> > >
