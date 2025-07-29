Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A8188006;
	Tue, 29 Jul 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753777897; cv=none; b=dIIHMZcdGvrCwMtC7JCTo+SJQYNhsXWYkYD6YwYqOY1OBtmlABTsY60Znt8zCJFHllKuzmP9sDj28+j/bQg6I6OtNIOJsCz3laZCa5Bxv1lf7F6byOxq/Uj2+84fZXqrqQc96/ue7ALKd33H5XqhdKJXUCUmBn+4j7h74UU7lGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753777897; c=relaxed/simple;
	bh=3RI8jIoJyDmrLUwJoPWxZREhJPgeAMp3caffnQq7nBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoUN7pUgVrUwZOVdHgXQFtu64uDaLiGv4QBTBCKpMepbooR5V9lgRkH+hb9XPN0aAUd/OR0Mnt3f2bXDPmGOFZ8U+2UrzWCc8dmlLMj+ftENoiVS2Um/FUxQjQHK9wfpH1pHq8KLAMdZyVwvUKpxb+SiwT5CnxPuO9E0mjn/oBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fARHZ0s7; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fARHZ0s7"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b34c068faf8so5347604a12.2;
        Tue, 29 Jul 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753777895; x=1754382695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3tQDpY9kmcpxqJo02gP5nd31GjHYrw3D1aQf8x0gRc=;
        b=fARHZ0s7EX77uRrW2RiEQN++INK1xDQG4S6jgaFARyGMibLn0zqbgybszR8vfMtpni
         h6V2MtMK0Z8DfqG2yDIIKONOyWxzfwGN6HOpbaMxZGmMvDSqVViWDxpv3b2VAsrEtRgw
         48CJ8gYVBfsHuogzPxUYG3dGUI7h37iomIa8/78piI7p3jmCQO+cYZGgB305+8sAwmJL
         ydHNl12VyklMxuNBWgbgVhAoXHUs73VuJFnjBQ16Ag0qj6HVq0fd/JAz7fcZwze5MG7T
         67NNVHjhmfNG7iCwFE3Xzj5EjKQOFVnFDIolGMj/h7qK27DknQyOHIXkCvh+2FPmMYyB
         d80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777895; x=1754382695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3tQDpY9kmcpxqJo02gP5nd31GjHYrw3D1aQf8x0gRc=;
        b=hXGeceQ3GuAQQP5YvKQ2/W4Gntry4cG8UZ8dQdE5Z2j0tYfN0fNRS9C7COZy72wI2k
         OxxFRwz82s+0e/jidpjDf9tLXAQ9HhqzP4TKJ3lHQz92OSbN87ElXPzB1XctRyRKUInf
         fbhaPXNcXw11TfG3t6Yz6u90WSpl2hwa/XN/9JJhXn18vcDQepsB2nI9EgyyZ/yNgyR/
         uDzA4iCPFbqXFOFKLCcwqi9ewwQkbDHZvAG+57TMTvNMvH4mwX2rVCxKJWL8pmoMi8S8
         qEYVzHnQZu5NyZtJNz4k8wbehKesArXuduMm4qFtG3ciAZLln4fwzPMKnwc8j6WuZIwz
         YLOw==
X-Forwarded-Encrypted: i=1; AJvYcCV2HAXiZ3JcExMg6AyZd0KfHbxzD79729jFQ0lplmG/Vgs1hCmDVHxcD5WWKiePK52fo+F3vn2hFlw1sB9z@vger.kernel.org, AJvYcCWxLmFa4iwoM1XFW80dqWXsh5t0fZz2bat+Wnw76Xh5gpX2R2UJvUFDjYd7tW86d1/NaXGdoJKrXSdf@vger.kernel.org
X-Gm-Message-State: AOJu0YwaH/XR9+J8nTjHXBEwlm9v7hCXD0SENekBU6Vnf2ymG2t53Rc6
	R7QbOVXjJxr1eN/AdC0m90S+IU9QDe+SW0likyRB84Tp+Wztv7mFgL8n
X-Gm-Gg: ASbGncuFIb8yTVvbHbU1dgvyYMmECKSUY07nXDmEKdFoq8FfEpK2Pa05IMUsEgB8vn9
	lZxHwPeiccS3B+su0O6glY+n2o/kNMtHK7EBT/HYitAqKAKeazOxAnHv94FoNTMx/NuyE/dOiRw
	2uUHoCMXcVFjrj2KU4ylnN4NoyhQLTuHx3zQNyzsUautScBspSv+8s0rUg95Qm8WQBBH2oIyo6A
	VdTLDfbZ96Vnz2YWn4RmvY9NOgM/XBr3VED/2he9JrxXw/KBWhWdC0MsBld7VwJG6oCmWEtPnK5
	OvzYBu4aOn+pokDoEk2Sln7cnO09xQFmS812oXAMH5xEP2v2EoOyDs5aEEHRvD5TOLYINSDwLVL
	eOOW/ZXopv2NGHj0U2dgCf4wC1fiQlvYV
X-Google-Smtp-Source: AGHT+IH3/A1CboxM+y3QmvNziehjws3MkOhzin8JJlZv9QPmsMuudb9IbcMH6qSkoi3W9mg9v6j4HQ==
X-Received: by 2002:a17:90a:da8c:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31e77a027b8mr18810110a91.23.1753777894979;
        Tue, 29 Jul 2025 01:31:34 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31ec91fbf4csm5462503a91.12.2025.07.29.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 01:31:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 16:31:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
References: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
 <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>

On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> processor typically running RTOS.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo C906L remote processor controller for CV1800B SoC
> +
> +maintainers:
> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> +
> +description:
> +  Document the bindings for the C906L remoteproc component that loads and boots
> +  firmwares on the CV1800B SoC.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-c906l
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  mboxes:
> +    description:
> +      This property is required only if the rpmsg/virtio functionality is used.
> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> +    items:
> +      - description: mailbox channel to send data to C906L
> +      - description: mailbox channel to receive data from C906L
> +
> +  memory-region:
> +    description:
> +      List of phandles to reserved memory regions used by the remote processor.
> +      The first region is required and provides the firmware region for the
> +      remote processor. The following regions (vdev buffer, vrings) are optional
> +      and are only required if rpmsg/virtio functionality is used.
> +    minItems: 1
> +    items:
> +      - description: firmware region
> +      - description: vdev buffer
> +      - description: vring0
> +      - description: vring1
> +    additionalItems: true
> +

Why not allocating these region dynamicly? I do not think firware is
always avaible before staring. Allowing dynamic firmware give us max
flexiblity.

Regards,
Inochi
