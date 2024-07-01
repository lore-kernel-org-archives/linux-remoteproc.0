Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE184E16;
	Mon,  1 Jul 2024 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719827961; cv=none; b=NnEpgrXzZsB2EuPXj+rgQjil9y/zUUWW9Y2m8XS209+0cgWqZ/yrF+CQi8qovfAPXKOMQEx5Zn9ChVOGSXDfd5RBuTOFRc5D/pasdGgEYOrpQBumfAtNAugqBqFN02vRJSlmnJxQd/vdfgWwTIC8Q8LeRWgsRUUKwLdj24IgHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719827961; c=relaxed/simple;
	bh=yxDMzOG0U5+P/F/j4afEEEjzxVgAbK1Mrw/30ECDFSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c9kkhqLtkWgl6ks1DBW5efxKN29ZaH9Ae3gGkXwmZnmuGHvbk0j2AYv9KpHAS5sOaZdALIDuQsYcHirH1MvUgHfLNGyZkdJvAXsrcugrejTP8RefSqqmFQ6CIbhz3h2jdZPa9zfeOLExnF7d3dmsM8maN+4ugHiK1q0x5rG58os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pNejx/5U; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pNejx/5U"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4619x6pk087165;
	Mon, 1 Jul 2024 04:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719827946;
	bh=eFhl0o0WMqC2e6vG0O6H26u/4nEtxtmUvV3MtuGtZUY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pNejx/5UhiNAEGu5YKM2R5soEBvVEJF0AWGj/EUFJvPd8um3hgENdW4pvO6KmmJPf
	 gf51o6QaWxCegTXfienA6w/S1WcLtq1LxcUk7nw1Iv/r5MFDvkjHmHWRiVk80ydl+O
	 rq1L+d3apblCuDFp2pW5jy9EoHWrg4eIKW3CEfwk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4619x6pP014061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 04:59:06 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 04:59:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 04:59:06 -0500
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4619x6DL116219;
	Mon, 1 Jul 2024 04:59:06 -0500
Message-ID: <9036f912-bc84-9179-5eb5-270fee6f8cb9@ti.com>
Date: Mon, 1 Jul 2024 04:59:05 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] remoteproc: k3-r5: Introduce suspend to ram support
Content-Language: en-US
To: Richard Genoud <richard.genoud@bootlin.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
        Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Udit Kumar <u-kumar1@ti.com>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?Q?Th=c3=a9o_Lebrun?= <theo.lebrun@bootlin.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <20240621150058.319524-1-richard.genoud@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/21/24 10:00, Richard Genoud wrote:
> Richard Genoud (4):
>    remoteproc: k3-r5: Fix IPC-only mode detection
>    remoteproc: k3-r5: Introduce PM suspend/resume handlers
>    remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
>    remoteproc: k3-r5: support for graceful stop of remote cores
IMO, the patches are better reordered as below (since there is a LPM 
rearch in progress)
patch1 - Independent of other patches and is clearly a bug fix.
patch3,4 - Support for graceful shutdown. A separate feature used by 
customers wanting to change FW at runtime and is independent of 
suspend/resume.
patch 2 - suspend/resume handlers..

