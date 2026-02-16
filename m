Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508E2C08A1;
	Mon, 16 Feb 2026 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258349; cv=none; b=q85aw3GLRR//Clnt2vMRGbQxev5DVMTIT8yaFlr2Vphhh1gm/G5fNxWnp9R22iXEO2aHAlOOxu2GHC2HfHQJpW+yrKss9qdvp2fu+Ml/cmAhJh77i22lPRXql8uWqYEB4lvK5GC222oMgWAxj/IrN6t9cBZk6ayljklr2AmVcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258349; c=relaxed/simple;
	bh=ZIrRAvjllCn/hKoRQ2+XroDeGZAvJ/+EjNpwmIc+KTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rbp35KWZ8WoM4iXwRQ4JXx2L9qOLjvkGgqd7pBWzfrf/U0Weoqt1oLmA+ohscTneK8OM8xW5Xp91mCYFbkkiFq+DS1u9zbOm+aHJrp6Pgmtttsemqo4M9DjPTDnaVKykE7s7So/cIm1exkfoa0hMaOv86VxYObLls7eKsVVN0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.104] (213.87.162.64) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 16 Feb
 2026 19:12:15 +0300
Message-ID: <5416c451-43fc-4feb-b3be-6d6754720884@omp.ru>
Date: Mon, 16 Feb 2026 19:12:14 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: <linux-renesas-soc@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>, Bjorn
 Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, <linux-remoteproc@vger.kernel.org>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru> <aZLVU9toZRX2vKX7@ninjato>
 <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
 <aZL3M6hT45I2WUaQ@ninjato>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <aZL3M6hT45I2WUaQ@ninjato>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/16/2026 15:40:03
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 200548 [Feb 16 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 87 0.3.87
 7430d8ffafccd8879e1d8370e5b501352446c2ba
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.162.64
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/16/2026 15:43:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/16/2026 3:38:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/16/26 1:53 PM, Wolfram Sang wrote:

>> Is that the statistically most-used response to that question? ;-)
> 
> That I don't know. I just know that I did build-testing for the whole
> series and the buildbots reported success. Need to look up why this was
> not caught.

   Maybe it just built the kernel after applying the entire series? :-)

> Sorry Sergey, you were right...
> 
> Hmm, so is merging all the user-conversion patches into this one an
> option? Maybe the RFC here can be reviewed per-driver and the real patch
> set have this all merged?

   Perhaps you should update the existing users to just pass NULL as
init_data in this patch, and only then do the full-blown updates of
the individual drivers?

MBR, Sergey
