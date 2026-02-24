Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F734D905
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973237; cv=pass; b=HcQWzN5IEhjabHexJtQSdgrZVGNdPc6V7GxmUNVKusWYzAg5cgGcsu8AGQ+fG4P80hJ4o+7FLzjxxoW4pxq0324OihrJojiwl6pz3NtmLQo5OrmCtjyEpgeT6jSL1bWPqBNYPHtk0nFC+HH9H1ndQF6DgwvWNRCgUdSB/k8TzKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973237; c=relaxed/simple;
	bh=mR2DxBgw13ANLVUMK5/jjvVRnqlmqJqFCSdBmr/gbTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+fZkEiMXRHZ9+8mnFgX/eCmQMjjJrrsjCND249/rP7kPd89vJC594jOsTUdJ0Qjw4AztmYYGcHRvUxGuryr7tmxapyC/It6oUeULU4MlGGVxJMUG2xIuPyanweIwrCM1thn40TnrW0pYsma3+4q4oZ7QWLssZd58zmx284tKVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcGQhEp9; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcGQhEp9"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65a380b554bso11813934a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771973234; cv=none;
        d=google.com; s=arc-20240605;
        b=YoE6We4NszOlhSZlIJfjJyfJoZc+xSYMM5Z65YEeJ+qJmwRwLmA6wE/kKywJ8rE8sv
         0kMbulKvy4wVn2275GbWKQyIRCI1LvZzCcgTZ4/l50o6NgA0LAgR/5loZN4awLIF8P4i
         uRQYzXj6C4LEy0LtYujfxobBbiFsWqZJbUYZB1mA9NVXws9ULRhDIzty42Qw7mrjr/rd
         BafTzkc3l5nyz3bcVZbyyCRj7S/JqGKAVeybfcw3qVO9jaAPq3wr4RpGe2X4bt5mrD/X
         XrRNDHPFHgTQvH2lz8Eo3KZeDpiE20NoibkOTVvwnHDsXG/snq9pMOOT9fxzqa2t2/+u
         7osA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        fh=YHRe2ACQUE/xiEi9SkteSbGZWT+g0ECdA7PQiHqI5WM=;
        b=fqjtIDsYVnEVotrB8tYy0wpNI6ELITLbk7O4/xXep1YY006VazweDbnfMTs3nCX2WP
         mzMOgDpRXwYTM25ooBWjwkxmiSFsSJfSXpm0bPYv6HAPx0eOAbKycA/axsy/TneLytRZ
         +nYjOjtqRtiX6HAH0qOM8jvLDOd1kNqhGWtYmuZWQylmqmLbB6D+aUFLvQq+omITAeep
         uT41+XTKX7XlzHMUUaTTkeG3unTSEOiRKu7V4RnB+zHlY3X/TSGa/epen28R8IBsl55b
         DMUV+uMro0G8m9Sko0p/BtoYjwV2sMJrx511FV0MpR8T7+HkKSlc1SJSi2DS4Lse+EBt
         ojIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771973234; x=1772578034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=IcGQhEp9hL6greYM2+2maoVHPZjWvdvDsAC086EqeqlFB0YHUO5Y3ztMzQzJKEi0ob
         Lt+ri+Gkh0UL8uCsGGOSWdplUDKskV1TTMTA7FbR61NQC9e+C+LYIqJEJbZ/Y9KgIIMv
         aYzZWR+0JarEqlnA0WiJEEtQcZ922DZ2U7CphKYeThvRJntrFunwA7FBWBq8hA26gbSH
         tVp4Zcok6dI0IPYKDzCk7xzhStEC8M6mtCMBiWm96Gf9Ti9L8zBcA/xQ8bvzu2aDIfh6
         yUN3ms3f56iLbCN7ALNTSSRYvD+BBWM26dk6BDHalYarc7BJ9HuZzjS2eBjye0ghsGh8
         CbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973234; x=1772578034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=aWVeShosU0WjH8/XEUueozopacqdagkRva/ylKMbtpB8MwNAkCtOpE4mENORHauyEJ
         uBv6mohnWeoIBON7DEFER75U+Uo3/FReEanZGm9Bo0AGjWwQBbGXw2/xQNaycyVhoaKz
         lYio+QtZk20+GkdfMNhBtgVsIEtUrnIsVWVIs/w8kRhOjJfOrNJVu1YLUsGQENLnlAM/
         Lna590+Nlb/dQ5QcFIUA3Mp/wuMZk+XY5CejU6hWaH4w6YWsAmjE/1EyHQEKHW3/j/gg
         qsAhkarXdDm0JX1W5Kybzn4CNN1TrbFu+2b8IceWJe20GScU2YcbkrP+oKxsWY1RM8FJ
         62nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnBAc2KgaAF85JCgIiYW0UwfEr4rOckIdgwhtIcGX1NQ/JlM213ADuH4K4nZ+yqf6V6Ncx8XDTW4WuHcMtGXZX@vger.kernel.org
X-Gm-Message-State: AOJu0YyugWb9fM4WSy9o2umEjP/oRnY80aN86FaolA9uQy/QdE2J1vcF
	dzvSYtjJFZ1rBmOS5kRs6VGRV4SBmHP3AeMcVgaMimLJ2IU61tz5NrTnqcMV7xWA9v7vcoX4iun
	mxO5mFLrXWw4MAb3swHpbiCU415gvvwBSZnFfI7n/gw==
X-Gm-Gg: ATEYQzzKTl8V8ZAxxOlPogfzyQxU07qDucKUrYgjTP/V0/EfGKAaAWpXMopTr5s76+c
	HX9prl7okMUYgFUx7N2aFctzQ0uZGJhIFI3aT0VEQ2Df4kUnLRAvCXEP4astCmebTrdsTMiM5QR
	l/HKfHvaDgcbdPEvKVktZQzWp35/gcFPzyDUcbzBlDwTChF/7X6S9s7iwfa89Nb3jqErgIEp1Bp
	N4EcsLHMgzf+07fDjvDvIiV1V9wdsfFg4ZGAD7THi4tPS12rIlZ8Nvz31H44Yyo2W9sEAUEjW7d
	v4WYBZm+TKOju7lppT7R8+86inskhSQJeV/A3L9gqg==
X-Received: by 2002:a05:6402:430c:b0:64b:3225:b771 with SMTP id
 4fb4d7f45d1cf-65ea4ec02efmr8235378a12.6.1771973233960; Tue, 24 Feb 2026
 14:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com> <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch> <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch> <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch> <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch> <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 15:47:02 -0700
X-Gm-Features: AaiRm53YSUao7_rhr1i52add55pdbzLxtSc_huet_gFbRkQV2slyqwkA4zQhORI
Message-ID: <CANLsYkzzkvSHVWt_DOw8q7DvD3mic12zcNR1wuxrG-_vG+H+JQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Feb 2026 at 15:32, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Tuesday, February 24, 2026 4:23 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: Re: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> >
> >
> > > > > + remote_cm33{
> > > > > +     rpmsg {
> > > > > +        rpmsg-io-channel {
> > > > > +          #address-cells = <1>;
> > > > > +          #size-cells = <0>;
> > > > > +
> > > > > +          gpio@0 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <0>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> > > > > +          gpio@1 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <1>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> >
> > > Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus
> > in the example above?
> > > They are running on the same transport.
> >
> > Doesn't reg indicate the channel number? gpio@0 is on rpmsg channel 0. gpio@1
> > is on channel 1? The reg value gets filled into struct rpmsg_channel_info when
> > the endpoints are created?
>
> There is only a single RPMSG channel for the CM33 remoteproc in this example-its name
> is "rpmsg-io-channel". As I mentioned above, both gpio@0 and gpio@1 run over this same transport.
> The transport here is the RPMSG channel, so multiple GPIO controllers share that channel.
>

That is one of my main problem with this proposal - multiplexing
several GPIO controllers over the same RPMSG channel adds complexity.
RPMSG can already handle multiplexing via channels, use one RPMSG
channel per GPIO controller.

> Thanks,
> Shenwei
>
> >
> >    Andrew
>
