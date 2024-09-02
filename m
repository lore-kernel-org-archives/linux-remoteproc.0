Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95F15DBB3;
	Mon,  2 Sep 2024 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261652; cv=none; b=b416Gj6ELbrQ5iL5rrrF+5xsrPD+RCuEa6gsDppruBIEKkZGbmTgcV7/xkfOpEos0BOoGCQCZg1Iy4LT7uqIjb+Nt/SSQFWIJv7f/UYyr3Q6UioinTmKQ9kaAnOQ5x/6kdzI57IdGIIvEyb8Bf8GwhIoYDxIlNnZJbd5e+bNOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261652; c=relaxed/simple;
	bh=++hGo6b12+vxq83JdLH9ooYDjvTjt3PqY5WgAfKFms4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LR1gXHhZoOFDat+q2FT/oxCOLxmTGrk7FQWSG4gEGKZKpiIgqLAnunLybL17q4M5gBKC0nKIDdWXbHRNiC1FPwlT5z/b3NjBhFEXij4dKxQzILElgJdTTnu6fLbDZBwnGX/Mz+WmDz9k+4y4p50WMvzpnZU7tsEewCB6Rw1RF6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gLjKyA66; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gLjKyA66"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4824snrq008347;
	Mon, 2 Sep 2024 09:20:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sLn8YX8O3WDqoWEd6Wy0yt1v1YptlaDbfBdJJeo6sw0=; b=gLjKyA66m6ulkqnY
	9BvNbbR8zZoLSZ0gmKbPABqYi3hKbtGhMSnD1TT0+eHvXPGh3GgZTz0lFY2mjj6s
	77ZuiokvGtQknaIbGPcrPOuYt1G7q49VbODXkpqeLVFiEn7ZotFmHXAotDr2FfBC
	zoyd6A9J3Mrvs5Pq0IoGWcwTqrjCaO2v9AZxwbdVhTZz8KAoiwjzaFETpA7uRcVd
	+Bf9K7Rge/UcM1FALM/zfaPjjBqYaEgsF4Qf1sb78dwj+qEit+Xc17wZ18/Xz3BP
	93O+dtiiJyB1BHEJ9xpCCUbPNRoG0b0RJG9pFDfwYzcOh8qTTiW/LfPzkE9ZQxep
	q0b89w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41ce4j3eb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 09:20:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 47CF240058;
	Mon,  2 Sep 2024 09:19:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B84121D23A;
	Mon,  2 Sep 2024 09:18:58 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 2 Sep
 2024 09:18:57 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 2 Sep
 2024 09:18:57 +0200
Message-ID: <cfc164a7-9cf9-42d8-8b66-b4567d3971ae@foss.st.com>
Date: Mon, 2 Sep 2024 09:18:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
To: kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <202409010034.Tln3soEY-lkp@intel.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <202409010034.Tln3soEY-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01



On 8/31/24 18:43, kernel test robot wrote:
> Hi Arnaud,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20240830-175609
> base:   5be63fc19fcaa4c236b307420483578a56986a37
> patch link:    https://lore.kernel.org/r/20240830095147.3538047-5-arnaud.pouliquen%40foss.st.com
> patch subject: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for firmware release
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409010034.Tln3soEY-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/remoteproc/remoteproc_core.c:32:
>>> include/linux/remoteproc_tee.h:52:12: warning: 'tee_rproc_parse_fw' defined but not used [-Wunused-function]
>       52 | static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>          |            ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/tee_rproc_parse_fw +52 include/linux/remoteproc_tee.h
> 
> 498143a453d14e Arnaud Pouliquen 2024-08-30  51  
> 498143a453d14e Arnaud Pouliquen 2024-08-30 @52  static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> 498143a453d14e Arnaud Pouliquen 2024-08-30  53  {
> 498143a453d14e Arnaud Pouliquen 2024-08-30  54  	/* This shouldn't be possible */
> 498143a453d14e Arnaud Pouliquen 2024-08-30  55  	WARN_ON(1);
> 498143a453d14e Arnaud Pouliquen 2024-08-30  56  
> 498143a453d14e Arnaud Pouliquen 2024-08-30  57  	return 0;
> 498143a453d14e Arnaud Pouliquen 2024-08-30  58  }
> 498143a453d14e Arnaud Pouliquen 2024-08-30  59  
> 

The inline attribute is missing. As it is a minor fix, I'm waiting for more
reviews before fixing it in the next version.

Regards,
Arnaud
