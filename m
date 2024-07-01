Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019A5C614;
	Mon,  1 Jul 2024 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719825194; cv=none; b=IHbD3XkwWdqAcbYnpq1nrhzorfzEJF/d8FtJ/kMrHd2pu4IdtR9RszucvbxZxu6kCNv87gW2DH6YfZt37vEuOtT9i0i2yAHs3JT+T09KN2UeGTKpOGn2RCal0gahMoJmtxaqnBvydwbKo9kzRGNHHgBhFHiniKIQT3KsjdrrG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719825194; c=relaxed/simple;
	bh=lH6Op+NEqMEMhLVrlVLSaicKVq6DDK95y/ji3hzNK7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uT7ivgqrdHCQhxuZE61IfzkvRTqZy4gBO+Xvnot6VmIzkrMBsfdSoxBHNnD8a/x61wb/p59f2ZKuwvJUHU3WtCDFlKQqw6HtzCPjiMYvFB7FJcBcWsTN0WWWVkir9BnlDcq+aTzz7F4kTH0NwlNsJgA8BHTNeEG8INYtRrk7Eos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LmHfupoh; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LmHfupoh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4619D1GD062498;
	Mon, 1 Jul 2024 04:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719825181;
	bh=gJqfpGs0H64qLnpC4fB9AmSwexSr+s5EWCWrwDYrIYw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LmHfupoh1oy0fRMKIRgVGeISn6aev/W3pz1QSTfbjAdXO9Pe4n6pRZzheCOzTbfPS
	 /tU4l0VV/G1zMrWywQmqz6t46tSWlLUavwDu82ubLLXT1L0boOpK1KgCzK/7NiZwhv
	 nlgRtYhxZIsQv7XKu4hdhG5FwkBntahEkZBLLhTI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4619D1ID090792
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 04:13:01 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 04:13:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 04:13:00 -0500
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4619D0qo023569;
	Mon, 1 Jul 2024 04:13:00 -0500
Message-ID: <3064a3cb-9153-3bd1-4c55-79e8911f029f@ti.com>
Date: Mon, 1 Jul 2024 04:13:00 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] remoteproc: k3-r5: Fix IPC-only mode detection
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, "Andrew F. Davis" <afd@ti.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Udit Kumar <u-kumar1@ti.com>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?Q?Th=c3=a9o_Lebrun?= <theo.lebrun@bootlin.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <20240621150058.319524-2-richard.genoud@bootlin.com> <Zn8UumUllbGS4/p9@p14s>
 <CANLsYkxFvci0o0ET4vOGTYp0P2xEdwU2q4V1SmNh=W83uj87rA@mail.gmail.com>
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <CANLsYkxFvci0o0ET4vOGTYp0P2xEdwU2q4V1SmNh=W83uj87rA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/28/24 14:58, Mathieu Poirier wrote:
>> This could lead in an incorrect IPC-only mode detection if reset line is
>> asserted (so reset_control_status() return > 0) and c_state != 0 and
>> halted == 0.
>> In this case, the old code would have detected an IPC-only mode instead
>> of a mismatched mode.
>>
> Your assessment seems to be correct.  That said I'd like to have an RB or a TB
> from someone in the TI delegation - guys please have a look.
Agree with Richard's assessment, and the proposed fix looks good.

Reviewed-by:
Hari Nagalla <hnagalla@ti.com>
