Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A8F383
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Dec 2024 05:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733290254; cv=none; b=sJKxcmgR4jhmjTlf8VF3bEsvMxREbwl1qM7GTZs9jlmavAWe4PMpd8poFKOZgXTu/9IMHmIoSHRmU17+elc/gOyJHj+h2iXfHxDYw6mkrRGZxMaXvhtyAVk9vZb/LKgSwhGtJCXkDBRxAmbhFaHQEQkRRIqKb/nrLdNnKLzXbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733290254; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=JmeqjR//1HLSrs5vFhTuy4BKUVj1KqAtgAvxDK2SFTeuWWEW7Opo5iaiEr1IumKZ8ZM8udPB7VqErdSW4tj6V2dYlPgeXSVw6SFHBnphOxudwhCO237w8L6+B5eTfakfwiSAWuF4EA/Qi+wNojK0B+qucFzEsJM4rkH4Qtjf0rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EeIf+CG2; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EeIf+CG2"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B45Uph0015604
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Dec 2024 23:30:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733290251;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; h=Date:To:From;
	b=EeIf+CG2NxFlXZwO1HvnoMNXcnbN1FTQYFmuoIQP0cBPW61LfbPKW7ZuGu/Hvy2F2
	 IZEIu/jy++ZTAxEK8xyQSSzMQ51yb1xNLVB/JmJuEsBjA6s6ZE/BbencSkN+j3Zlof
	 3v+uh/E0kYWLWsjzvOop+ao+ZbkVjpqtlnRw6g+g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B45UpoC099515
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Dec 2024 23:30:51 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 23:30:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 23:30:51 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B45UolN050396
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Dec 2024 23:30:50 -0600
Message-ID: <af80c335-4c87-44c8-9454-93123d682c98@ti.com>
Date: Wed, 4 Dec 2024 11:00:49 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <linux-remoteproc@vger.kernel.org>
From: Beleswar Prasad Padhi <b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


