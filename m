Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3982989BC;
	Mon, 16 Feb 2026 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230056; cv=none; b=WyoJ+cDT3Cpl4N8HmsbC5/C5wWFlLZ3bMn6aIyGU7MX5CwpPNrI2I23WetyPWfXI50pMxyiNGoy58xjwknIs7z88OAVi8hThbAG86uyVRpaZEVI63zpB01Xtf2zyu57fplWeFEuV7aH2HQr3eYm4T9YqlYgvhf3nRKkRoGQD39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230056; c=relaxed/simple;
	bh=S4PQWXvyC8E+w9CpPWXD5elYcuxgkAeVynOYXrnOZgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VKVq4aDXiDjxEV1RybLQK6G2LsMwHNkDDWYmuMHZiQQTsYCsPQgLrTxiD8dLrvkXIcvXlp48SlvmS4x4KdUJ2DaPEGKzAqEIarqPzcZDNpF9Jb4mFTwRnVN7m9YgDfgkssoBMGW/nfMY0hqSODW0arE/SUpqA6hFAO8vKiXLxEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.104] (213.87.133.175) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 16 Feb
 2026 11:05:33 +0300
Message-ID: <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
Date: Mon, 16 Feb 2026 11:05:32 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-renesas-soc@vger.kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	<linux-remoteproc@vger.kernel.org>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/16/2026 07:49:18
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 200515 [Feb 16 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 87 0.3.87
 7430d8ffafccd8879e1d8370e5b501352446c2ba
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.133.175 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.133.175
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/16/2026 07:50:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/16/2026 7:04:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/16/26 1:54 AM, Wolfram Sang wrote:

> To hide internal core structures from providers, a callback is added to
> the ops which allows to set the 'priv' field of a hwspinlock. It is
> called when a hwspinlock device is registered and, thus, iterated over
> all locks. The register-functions are also extended to pass a data
> pointer to this callback, so it can do necessary calculations for the
> priv field of each hwspinlock. Providers are converted separately
> because these changes need dedicated reviews.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

> --- a/include/linux/hwspinlock.h
> +++ b/include/linux/hwspinlock.h
> @@ -30,7 +30,7 @@ struct hwspinlock_ops;
>  void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
>  struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
>  int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
> -		const struct hwspinlock_ops *ops, int base_id, int num_locks);
> +		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
>  int hwspin_lock_unregister(struct hwspinlock_device *bank);
>  struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
>  int hwspin_lock_free(struct hwspinlock *hwlock);
> @@ -49,7 +49,7 @@ int devm_hwspin_lock_unregister(struct device *dev,
>  int devm_hwspin_lock_register(struct device *dev,
>  			      struct hwspinlock_device *bank,
>  			      const struct hwspinlock_ops *ops,
> -			      int base_id, int num_locks);
> +			      int base_id, int num_locks, void *init_data);

   Don't you break the existing users of this API with this change? I see
you're fixing them up in the followup patches but that's not how it should
be done -- the compilation shouldn't be broken...

[...]

MBR, Sergey

