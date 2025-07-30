Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9DE1E834C;
	Wed, 30 Jul 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753855579; cv=none; b=gqKkMza00ou0jF4/RUINjNoghlnikjxXFzA4rwNKYTtl9C+o4F7VlJ3nMrbXztEKKUc+0tXA43qceR3o2q5CfUxDPkOm7aJBxSf/ot5EX7gU7Zch8e5AcWQfAn2EtKrq+t7/lkRDBGx/JT+cag5zu5OhVomBZVGhfBwfcvoVqNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753855579; c=relaxed/simple;
	bh=KvH45e+/9lyZCeYn358sK44xvyOu0g5nN+QuvhM0eik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXhbruTlc1pqVCt7ih0J9mOARm1jI6aBi2mD/R1sWbLkoFY+pVPiMHnvYlX0bweYLCS+6AvlVEH9p3sp/9ps3Yh8qnw9j9hUYobSSHVBAZu0Q8XcDZe/sG6vCqKxDibu7mkJZ8SxEAWRjTD9O7+m92f+Q6CHXb4ILS0HjPgtLmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYt2iFY5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYt2iFY5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23dc5bcf49eso88547745ad.2;
        Tue, 29 Jul 2025 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753855576; x=1754460376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaSd7z98uCro1WOAlKL+w8mLWZF6xQx0RvfWxxYIkg=;
        b=PYt2iFY56Z3LcgZlnFNDkRYqwgmhcal4KjAvU89VcxccR7G8btTJwRTY4gCG8FBNGV
         fej6Pn6cNVBNRXg1HmPtLmK+hXSFLtwNLlWhdcfByUwIJEeamb6PpBJ24h+2iu4Z1Ym5
         qqmrzFScBbrYRnQywHaPdfUjQlD5qMWIAsHF9vR2hU+sl1O9Xwzo1FnKzTtCqXABSib5
         Rl15Glty+Zppu4Dd6mvebW/b4DYqauXtJU5O5Em0qMuPI65GKx7abTnxS05H9aK49w8d
         vgvQP6Uy8wR58IYxiwoMJPJ8/ufj1uFni+XJR/KTWQa+pz1+67P2zhPj377hjuF4cIGg
         kTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753855576; x=1754460376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RaSd7z98uCro1WOAlKL+w8mLWZF6xQx0RvfWxxYIkg=;
        b=cFNE67PwCgOtW2yVn24CHvLLuJleB7NWt+GuJdb0oc2I4O/kc0a6T0RG9o4KwuP861
         IkM4CTn+Tvd0H7TbiGMde5NHOWd8pz0/BCz9p8J4hqU8xcvOHVAV05K3VJlWJzmqbTvb
         LYJVPF4eabdJkfIxcEdqIT5hqwFF7VyJfGcAgW/GsnBlxJFBlCdKpYxBCww0Y638hjSV
         m/nUeRiS8LbjTEZlz8Wkp6cWdkYBxYjEWAGFUrvqdoJco8M2s4pkmJA1kRZvUhWLy14U
         RXWm1xFQhatEIMYMLuRhKbs25EG2MEv/IfwOUyT/4YEdWhdwTcg9W6myMPycdp2DPTyU
         wsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW9V06smlTRJ280LEEZt5m6DNUbktPKQbAmhDyUVPwefVTE+DSYpW4vlS3EFhcWa+A4WSjKvhFeaJ0wicO@vger.kernel.org, AJvYcCXn+nwvi8sCyL9xNnS2CZzBgj56b7Yph39UON+W25Nimhq/eZE0vjGpDUgmLvmUwJ5zncxzKuBtp1ID@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrdVh2nMSQMT0r05iqDx0bCimJI6nqzj/okFJSHcjhFthbr7J
	hniiJjcEKCNehHaXajzCffjXBsU285aQK86gtpdNmFMCwnf4RKLLn764
X-Gm-Gg: ASbGnctHRnEVNZbijNNjieKjtb7t2tdpdcAGgJJJjyC8oVNvPYOcC7TiV7irPr2Ecxg
	0riTHJuRITOdibwJ3KI0BoawnOJwfvGfDea6g/Y/2w7icP7euDQLMkrp7nNGON2G72fcKgGwDJZ
	N6i1/TYkePWqOkLW9Ii1thS8KL1bYWitN1rc619bjhZdmjG2kO51DH6RSi3mms7Tnnw3ZSXcyiN
	Z9Ykr443wK+F7PRzWPLlDnwkNIRFaaHs7Vq+ocFs86Ny+1CFuma4zOfBL0GBUSecDdRYU9dj6bb
	ag3q1lA35bZ85QyG+r5km5mTti1rwAzZ24Hf68olA/3Xj0yOscmBJiQEpBs2y+KgcPqesfs99SM
	XHfXtDnGb9r2/JIn+wEaQ0Fc0AzQPoaUD
X-Google-Smtp-Source: AGHT+IGOb7R6cAkF2XQtdnUrwUvguwI6b0roCbfnnbe1O66LzmjhYar4PM87eH98FGS0Asl/DkAKzA==
X-Received: by 2002:a17:902:e751:b0:220:c164:6ee1 with SMTP id d9443c01a7336-24096ae693cmr31488755ad.32.1753855576452;
        Tue, 29 Jul 2025 23:06:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23fdf58abe0sm83899965ad.145.2025.07.29.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:06:16 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:05:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <bfvsmafcsxy4gr4dsprn4z4yl2lltgje2oilsny7vanb7rsolq@t2prbsfisioc>
References: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
 <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>

On Wed, Jul 30, 2025 at 03:57:09AM +0000, Junhui Liu wrote:
> On 29/07/2025 16:31, Inochi Amaoto wrote:
> > On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> >> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> >> processor typically running RTOS.
> >> 
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
> >>  1 file changed, 79 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> @@ -0,0 +1,79 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Sophgo C906L remote processor controller for CV1800B SoC
> >> +
> >> +maintainers:
> >> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> >> +
> >> +description:
> >> +  Document the bindings for the C906L remoteproc component that loads and boots
> >> +  firmwares on the CV1800B SoC.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: sophgo,cv1800b-c906l
> >> +
> >> +  firmware-name:
> >> +    maxItems: 1
> >> +
> >> +  mbox-names:
> >> +    items:
> >> +      - const: tx
> >> +      - const: rx
> >> +
> >> +  mboxes:
> >> +    description:
> >> +      This property is required only if the rpmsg/virtio functionality is used.
> >> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> >> +    items:
> >> +      - description: mailbox channel to send data to C906L
> >> +      - description: mailbox channel to receive data from C906L
> >> +
> >> +  memory-region:
> >> +    description:
> >> +      List of phandles to reserved memory regions used by the remote processor.
> >> +      The first region is required and provides the firmware region for the
> >> +      remote processor. The following regions (vdev buffer, vrings) are optional
> >> +      and are only required if rpmsg/virtio functionality is used.
> >> +    minItems: 1
> >> +    items:
> >> +      - description: firmware region
> >> +      - description: vdev buffer
> >> +      - description: vring0
> >> +      - description: vring1
> >> +    additionalItems: true
> >> +
> > 
> > Why not allocating these region dynamicly? I do not think firware is
> > always avaible before staring. Allowing dynamic firmware give us max
> > flexiblity.
> 
> I'm afraid it's not easy to do this.
> 
> For firmware region, the RTOS firmware usually needs a physical address
> to link to, and I have researched and tested two RTOS (RT-Thread and
> Zephyr) on the C906L, both of them do not support position-independent
> execution or runtime relocation. Therefore, a reserved memory region is
> needed to provide a fixed physical address for the RTOS firmware.

I think it is simple and possible to add PIE support for these RTOS. As
the memory of CV18XX is limited, I do not want to see some reserved
regions. This may hurt users who do not need this.

> (In fact, there is already a reserved memory region for the C906L in
> cv1800b-milkv-duo.dts)

This is just preserved for vendor zsbl and I have a plan to remove it.
Always let linux take care of all memory. It is good to support all
firmware implementation for CV18XX.

I think it is always good to use remoteproc like this:
https://www.kernel.org/doc/html/latest/staging/remoteproc.html

> 
> For virtio-related regions, the RTOS firmware also needs to know the
> shared memory regions for communications at compile time.
> 

I think you should investigate this and check if there is something you
missed. I haven't see any reserved region in remoteproc binding mentions
virtio.

Regards,
Inochi
