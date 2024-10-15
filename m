Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2341D90CD;
	Tue, 15 Oct 2024 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992863; cv=none; b=qJVCfeIMM2KhHuoZNsXYfnziLQXDA4MCyszxlDcHUb3bibgbIOe/NghftfFZ/KTFSQkxoitZqpFzV6AwBRD+9qgwMX0VgzQsR2d/Mb8OlyeZNaWpd6Repk8rIMhZeu3pLROGVx3FreCa7ixharQybbXCs4drG8Au139Ke9w3h7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992863; c=relaxed/simple;
	bh=u5AGJZbozkB40tzpeBr4jueNpsfSz7RLNYEPcgjK3mI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1AlT5J+73s/PsYInViPZZ5eGEtY5lFPGL0xA/BZaXmo+RgwBK4l2pXzUNZbBw1TPlIfIiz6BY5Z6vKvjPITJE4dwzvUjVl3fxzwc9Wa9cI/aOWwyPgpaGY5918dLa6u2qvnWXIlRtkJ9ThgB/MHzqLh8UdgKgzcHXQPJs0BmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PzYJbgaL; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PzYJbgaL"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49FBlRDX063484;
	Tue, 15 Oct 2024 06:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728992847;
	bh=aIapqA6FHf2A0zymdMlGcDtmtvjitsj2hgtu4BWewyg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PzYJbgaLxE/JNgc08CumgVe5fDV0uleiEnj6+BgL6KUxG8/lvvUke8WN4nfwx5pGQ
	 J5amu/uZB3/LHs/tbY101Ux2OJ6XyB+7d3NeBRipy3wnxm3Ia5tl6fTNA/VTgr4nL7
	 BkpTJA7Mta2YnFABw1KByalbCKc7wNjOAhuH/Okw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49FBlR9N111700;
	Tue, 15 Oct 2024 06:47:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Oct 2024 06:47:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Oct 2024 06:47:27 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49FBlRfb105410;
	Tue, 15 Oct 2024 06:47:27 -0500
Date: Tue, 15 Oct 2024 06:47:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Hari
 Nagalla <hnagalla@ti.com>, Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
Message-ID: <20241015114727.57usuxrhpapiofvg@fretted>
References: <20241007132441.2732215-1-arnd@kernel.org>
 <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
 <e6c84b91-20ce-474a-87f8-9faeb64f3724@app.fastmail.com>
 <20241014165238.nbllvtnxrxbwg344@frying>
 <585e5471-8a49-43cd-afba-055855be8e75@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <585e5471-8a49-43cd-afba-055855be8e75@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12:26-20241014, Andrew Davis wrote:
> Stubs only make sense for optional components, like GPIOLIB, where
> the driver using that component can continue when it is not available.
> For all drivers that depend on TI-SCI it is not optional. The dependent
> driver *will* fail to probe and error out. These stubs do nothing, and
> I'd like to just remove them.

Fair enough. I'd like to see a series where the drivers have
been converted to modules and we remove the "select" from
arch/arm64/Kconfig.platforms - we can then drop the stubs once the
modularization is complete.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
