Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CA651A734
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Sep 2026 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549131; cv=none; b=Ci1XOnGOC671XZHRe8uja4ypgDV4EnvzGmEFXFANkW9pv7rj35zrxia5cnMAraEPw6gwq+NUuep9vBJ2ABYKUIS7jWBaxOXzcCHYW+szdQAwUPi80grV8pb2IQfyMQiL6VyJz1jD7ZacB+s8BR1qLm0sIMQghZCd4KKTMWaWDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549131; c=relaxed/simple;
	bh=ZOaRv+ozQi0YBXWLi8zsbpCBh2H8RMSfbYtlbKbXi4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uahkzoxAHnwYjDkzyyu6o/zNlDxBOqFZ/MpN6tmwo1L+rXarDAc/Yp6lGltSBR0lWkGlW5kL0qc0mTM4Ge/Y00ZsqKo36kWqTRhk4muOqZlCwOygYF3JhSoTyVZXV8a5AYgW0l/KYwrEMvwMNbVbHlFuBjOly8ABM9NVexjLlP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o8KnIo+I; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o8KnIo+I"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8568e3ed034so955692b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Sep 2026 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788549126; x=1789153926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=;
        b=o8KnIo+IMD9p5IduEgDSL5oG8GLoD04niQT1Cw86IpMXvYzMBCC+z4d6ReywCZt3Q8
         UTcWnMBcq74z7AfvLKlnXRpEj1jLSnpOirkdPC56AzctE2tTHe56ttxj98f52Nfrcvei
         RnwFqCNTB27ggDEOYRNZpTYvOS+PNYX9YhSErdJfC7ezBhzIXvcCML7HDDj8kZvcOY5q
         ML1NVBFsqbjMTf41qPyjSI9sYhOJ4uAgzeuxc5nPPL945xF8hYjVgBgjiHgyk0hx1qRI
         +KWAcL1Cq+wSKOjS0iSVMRVq0ILWqz2V5PGPEEFNntKg3+LbH90Au+wQQUUZrK07y/s/
         xNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549127; x=1789153927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=;
        b=hSbEWI4AG6Q5WdWvnKcJlF1zuCdXAS448F8SmxxmVZ6MhwnL/BL+bxYMzc6UDiD8m5
         KXrGPE9VF/2NeQGNpz/lBfVxkCPv8/jNBZU6putTp9hzdQXcPH+CY6To9i4Tr66xScYr
         YFNNAluer/HJhKUIc9GJJJ6VGtsYrBmN/LCHB1UQWZfXq/HkWRNHxD5NZQoO7mffYjFQ
         e00XgM4Gl26r41K41OY/yTlOOxU3gRKV1cMsvZDMWMmKeacoigWLHenGcohUi406hKeY
         ngNKMP1y9+uxVjXNopHxNgsywOFjBfY8/2Jkn6W2zBXEmzez0cxK16G29QO2/DfKRn1O
         b4pg==
X-Forwarded-Encrypted: i=1; AKwUvBziAB+IdYhzVqQZo5htt/1TDlDoVV8amX7ndSR32A4ImGXy1zJIYBY73pM8BR7UtqHOjBQALBU/7uMHjZ4PRMAP@vger.kernel.org
X-Gm-Message-State: AFuF++kYR4l6KP25h1dX4VAhVrMk97wbjWmMJIRWLrG2DuDNyMBJrtTW
	LpmzlO4lrpg3iEn/irFZ10lhBXw7Mt433NrFQpMw+63vAmuytJcCF2fdhaIQ7bN32rM=
X-Gm-Gg: AYBFou2vV9M60NRjl/zpk4CsJsAlL/S3qADGCE4w5NkkTewGR/sgLYgX/gyj38mNBJC
	FAJKKehZzG5F3IrDWYwQH33W3qePdYU77rzimYqRWJX8EQoBuUKomwHSyC7tSfaUBtG3+Lu3nus
	W9vSjEFUS3H80QkqP7DqSxuXUEyXt4SRnVYfPkBl2ynRvV80t72jh5HlK9f4rFQvjMaFW8jbQSE
	eSUJqcdWXmbxiMvRPFXPTs8w0c723gbDmsSa+RSPTHrvoMfEMrqsdvHzUVT2nqSK/ja1X05vgcS
	AhI3/27GgtHD9WLAyBU5Oh4pPjbDbqY4uoMXLZCVah1agwaRyrPTSOIB/8dNQdaeWL7LaPfyrBt
	6ExC9F6ZVoIdpM3OBxR5mawVrGVZJpdkU/56T7zCvBI9zV7469PPxQ7Na2H/Itf7TlEDI6Zfb5j
	vJCpb3y7Tma+V3/hee560QcOW3g7jYyh/zdDw8JFzzhcuOTEjIDmciG9NHblbgQ4/s
X-Received: by 2002:a05:6a21:1392:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3da3a13d20dmr12237083637.25.1788549125532;
        Fri, 04 Sep 2026 12:12:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542bd2asm1217812a12.12.2026.09.04.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:12:04 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:12:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Marcel Hofmann <marcel@hofmania.de>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Message-ID: <apsYAsY31HEIezay@p14s>
References: <20260827123136.438798-1-marcel@hofmania.de>
 <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>

On Fri, Sep 04, 2026 at 03:32:08AM +0000, Peng Fan (OSS) wrote:
> > Subject: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
> > region boundary
> >
> > From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> >
> > The address range checks in imx_rproc_da_to_sys() and
> > imx_rproc_da_to_va() use a strict comparison for the exclusive end
> > address of the requested range.
> >
> > As a result, a valid request that ends exactly at the end of an address
> > translation or mapped memory region is rejected. For a region [start,
> > start + size), a request [addr, addr + len) is contained when:
> >
> >     addr >= start && addr + len <= start + size
> >
> > This occurs when a loadable ELF segment fills an entire mapped
> > memory region. This can be produced by a linker script that extends
> > the resource table section to the end of its designated region:
> >
> >     .resource_table :
> >     {
> >       . = ALIGN(8);
> >       KEEP(*(.resource_table)) /* Resource table */
> >       . = ALIGN(8);
> >       . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
> >     } > m_rsc_tbl =0x00
> >
> > This produces a ELF program header like:
> >
> >     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R
> > 0x1000
> >
> > In this case, the segment size matches the mapped region size exactly,
> > causing the address translation to fail with:
> >
> >     bad phdr da 0xa4220000 mem 0x1000
> >
> > Rework the upper-bound checks to allow ranges ending exactly at the
> > region boundary while guarding against integer overflow.
> >
> > Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale
> > imx_rproc driver")
> > Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-
> > digital.com>
> 
> Tested-by: Peng Fan <peng.fan@nxp.com>  #i.MX95-19x19-EVK
>

Applied.
 
> Thanks,
> Peng.
> 
