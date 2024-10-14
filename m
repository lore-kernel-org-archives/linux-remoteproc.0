Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3795B12F375;
	Mon, 14 Oct 2024 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728924771; cv=none; b=IXp5kZcfYzRktrKS26epl+QexIDiJ8EjeKcQG7+3KvbP8CJNWXcX2JctKVpebwKgJIHOJq38169CN43fF+Uz/9YQA8sOLQgmGThIoRDtgXWnbt2Tjwl1+dgs3l+wPFQqrOJ1qwmDWQZSwjXGX+w7PH/xwQuW/p1s0RGrk9U8mZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728924771; c=relaxed/simple;
	bh=Ztkly/rMkaWdVNeB/73idbucB5sLB8qFFs1eUamlwaY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9tdzhhpncqBDH6EuhIysusHdhx1wR2rGzasSwDTQNEEHu7xWUMTbtB3/3bIWvMdVEEzh429vz/gKJidf23kKPRfkJtkRAV3xFWAs8AHQPdvuBsPMIyTPYPiqm28462RLv71zcY29y6zvBSiHu2kIomoByxr9x76174vPhGZF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IIJ02sFf; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IIJ02sFf"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EGqd1t108401;
	Mon, 14 Oct 2024 11:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728924759;
	bh=Jr7pHIsb68Geivv92aN4TTQByvEqaA6UjhGr+i1/TUI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IIJ02sFfgOcRzFF8zuOFZawow6HHECA9uQflxVkStpUXxYKz2ZiWNA+Z+6Hme05rN
	 VlUDfw1mx0RdGq03VKkVGvTvFAylIch8XgQeTMQ3NY1iFCfVdqJHWplqFnbrxSOJQI
	 bRPbDAPuhqzg7E96pRdfs0Ypve4SJHB6BGrEUdN8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EGqdlL038661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2024 11:52:39 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 11:52:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 11:52:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EGqcSG069925;
	Mon, 14 Oct 2024 11:52:38 -0500
Date: Mon, 14 Oct 2024 11:52:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Hari
 Nagalla <hnagalla@ti.com>, Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
Message-ID: <20241014165238.nbllvtnxrxbwg344@frying>
References: <20241007132441.2732215-1-arnd@kernel.org>
 <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
 <e6c84b91-20ce-474a-87f8-9faeb64f3724@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6c84b91-20ce-474a-87f8-9faeb64f3724@app.fastmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:43-20241014, Arnd Bergmann wrote:
> On Mon, Oct 14, 2024, at 14:56, Andrew Davis wrote:
> > On 10/7/24 8:23 AM, Arnd Bergmann wrote:
> >>   config TI_K3_M4_REMOTEPROC
> >>   	tristate "TI K3 M4 remoteproc support"
> >> -	depends on ARCH_OMAP2PLUS || ARCH_K3
> >> -	select MAILBOX
> >> -	select OMAP2PLUS_MBOX
> >> +	depends on ARCH_K3 || COMPILE_TEST
> >> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
> >
> > This line is odd. IMHO "COMPILE_TEST" should only be added to ARCH_*
> > dependencies, as often only one ARCH can be selected which prevents
> > compile testing drivers with various multiple architecture deps in
> > one compile test.
> 
> I generally agree, but the TI_SCI_PROTOCOL interface
> definitions that were added in aa276781a64a ("firmware: Add basic
> support for TI System Control Interface (TI-SCI) protocol")
> appear to explicitly support the case of compile-testing.
> 
> See also 13678f3feb30 ("reset: ti-sci: honor TI_SCI_PROTOCOL
> setting when not COMPILE_TEST").
> 
> > Normal dependencies, on the other hand, can simply be enabled if one
> > wants to compile test its dependent drivers. In this case, TI_SCI_PROTOCOL
> > cannot be enabled as it has a dependency up the chain that doesn't
> > allow selecting when not on a TI platform. We can fix that as I posted
> > here[0]. With that fix in, this line can be simply become:
> >
> > depends on TI_SCI_PROTOCOL
> 
> That's certainly fine with me, but if we do this, I would suggest
> also removing the stub functions from
> include/linux/soc/ti/ti_sci_protocol.h, and the dependency in the
> reset driver.
> 
> Adding Nishanth Menon to Cc, to see if he has a preference.
> 
>      Arnd

While I am OK to do the cleanups and make the drivers independent,
I am also looking to make TISCI stuff independent and be a module
itself. So, dropping the stubs will probably get in the way as we move
ahead with those plans.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
