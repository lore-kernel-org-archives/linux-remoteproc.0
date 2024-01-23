Received: from smtpout145.security-mail.net (smtpout145.security-mail.net [85.31.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1E5EE85
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=85.31.212.145
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706016910; cv=fail; b=BUky2sf+R0qeOAkFF1FoOeB/aCd82MIL9IPAw555+hFvL4maGXkFqlVNvdpoj1h/9rmIiJX2pJHwzRdPPktrCQv+ZyKg8UT0oWh8ukIa9Xx3GWIkQzJNYT+TOUYVfwnKtYLvqTjwFthCnB343riOYNKLEXtx/94IYHDxOOR9pUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706016910; c=relaxed/simple;
	bh=e3eeO2ZbjlAjYkargmHl9GsRg3aSHe52PIt+J27B8ww=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=jdaQw4Kvof9TWxCMcNQa8C+KHP2QveB2nl0+s9pqFw8Os2i+Tfj5qCsrZmi8z/Ev7zw90P01VAu+3usnslNjgS0Zq9tLBbnOtfJu4JF39rjBfHjsLscmcHwO7h2gRfZ99uh3umnahXXEjol2PZx1ScFAbghDzpW0aPin/IMZWbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com; spf=pass smtp.mailfrom=kalrayinc.com; dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b=eEYgj2/Q; dkim=fail (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b=V46UwhaW reason="signature verification failed"; arc=fail smtp.client-ip=85.31.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kalrayinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="eEYgj2/Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="V46UwhaW"
Received: from localhost (fx405.security-mail.net [127.0.0.1])
	by fx405.security-mail.net (Postfix) with ESMTP id 4E7E83361B3
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 14:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1706016769;
	bh=e3eeO2ZbjlAjYkargmHl9GsRg3aSHe52PIt+J27B8ww=;
	h=Date:To:Cc:From:Subject;
	b=eEYgj2/Qo80ov/oVI6Zrw8EksakWAyk2iKgXN3r8Z/4iJea1m1b3Z+xiPvcfNugaY
	 tu2Fw81UiiO+iXJ0qnguoFKC6Y0hyxjYxZO9VmBnPo3Jh3oBcNnwL7Q0lGYNnQXruL
	 DLqq9aFNDhCRpsLddHgy0p0JU33EPHG4YKYo0FcU=
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id E25C733619D; Tue, 23 Jan
 2024 14:32:48 +0100 (CET)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0101.outbound.protection.outlook.com [104.47.24.101]) by
 fx405.security-mail.net (Postfix) with ESMTPS id DA53E3361A3; Tue, 23 Jan
 2024 14:32:47 +0100 (CET)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MR1P264MB1586.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:32:47 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1300:32a9:2172:a2a]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1300:32a9:2172:a2a%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 13:32:47 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <4a6b.65afbfff.d80ed.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRWL6S1eixtt3JZmKDkit0dlcfKQ/7WR1onmG/e/Et2dynwhiN6sb73kK/04CJtGbgR+j+eGlDSnIOZIkorLLWizm+bWkYVknS3R2J7eqymtGLZIwpZTAYlX29qBGbmt6LiBJEFFE91I8L82pIvp1ZMa1IUHJvlzVOw4vKb7TDpyPLHW3nuMXYIfNlv1EtuYrDUo55ytRq9UEr+/I2FO9Y0UCdnqDIBBnMDqbvhaDqiMBEr93WP0mYDwIlYjCcwkMtqMTFqurKX8uXTt+GtKiFgfqsF7IoWaDr9xQYqYVh1ZrFql+DKhBe68N7KiWRPigmXDwim9E8KLqEEmuEqiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A17fXmT7c2I+4ogOq3iuILw857fnNWIBZaBZrCP5AIM=;
 b=gYkLk9yq2PALcAVlfwbYin9z/WVrprgiLNmwwffaT6Py7+t24cHvH9cg22WLnN1GYeVTOlvRT2OC3lin8MK1rIvvXjfWgbwOL0n9wwEYvIrbOW70RxkCvIzpahk7NQ2/EATmV80/E2LDilWk6qdIfRyJDBaPIxVFKTogimorpImTBZOdPltM29ld6HXaiYpS6mkEWiUea3nCMCtlSiJD2Xvm0BYx+KwDhC0agCzwRbzwapvpMYEKkn+yWb1BPdCZuRhQ6fF8pZVjIrWFu6gcFCXmcL8Zd9BqsaZKW0dBp5OtuP1MWbYAOxjWX/9mtDJtXH5/Z+7TKjEzw/pdjmSaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A17fXmT7c2I+4ogOq3iuILw857fnNWIBZaBZrCP5AIM=;
 b=V46UwhaWxOwe7A3HNjPzA6WtE2ge3j1NXKFVv4hpaT+WByAqLlX8RF7B/Dhrn2V7FWM8aEt5hXAzUrm3pdDxtAJ7Y0cLvmgpGfHtpvFPiTmfrN4giGGlkvtUwlVd18LD3ru8RnW9m2u2R0nFEtnoRIiJ5j0QHyzQpSsgAyLkYNkttQNzJhntMHpSD/6IT8rNUVtU6USFXNu+VOEx4u1tpPxDUnhe9JaJBAAPA+/XOwQB3+6RVKTm9hRoBlkIvopmzOBUQV1+7qJady2jsvqFX0l1cE/82eJS4gZElfBDCqzcUakXeszYIvGs3IikmfjQNLAnTu+6bE2HIdoukypeZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <9c32f94e-869a-16d3-6bba-064082518ce4@kalrayinc.com>
Date: Tue, 23 Jan 2024 14:32:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-us
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Julian Vetter <jvetter@kalrayinc.com>,
 Jonathan Borne <jborne@kalray.eu>, Arnaud POULIQUEN
 <arnaud.pouliquen@foss.st.com>, Julien Hascoet <jhascoet@kalray.eu>, Damien
 Hedde <dhedde@kalrayinc.com>, Titouan Huard <thuard@kalrayinc.com>
From: Yann Sionneau <ysionneau@kalrayinc.com>
Subject: [RFC] Passing device-tree to remoteproc?
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0104.eurprd03.prod.outlook.com
 (2603:10a6:208:69::45) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MR1P264MB1586:EE_
X-MS-Office365-Filtering-Correlation-Id: 208e472c-19a1-4b0d-641b-08dc1c17c959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ezhf3QPmNF9Q6FhW0RKh7FF//MBvSotSccLFLdazR7hdI5PvFpmKZK/LDTg7hnVvGpoYz2iBwaEnoWJi97QxWrMupZQzgfzbKJ/yIlHkLRBvKw26qjDuFFL7XQja160VZ78qF0gwTtuya7OGuJhqAsyKkJosM2/undD7SwqH6w4POdjc5wrRLzJAd0VfLFSrjuVo37P1msXDAjZOGJdfPDvssswoBkl4nW7gX/3mlR8KmZLk0rCRGEuLD7MmEljKvL6yQDqB10WgE5/1knqkGP6WhFJKYlX8fiI76FV84T4c58Jdff+kWTHaoCBgWkhqRxeRgpSEgWvgUADzf/+r/Tsoze5royNKj27EbJ0RnCCGy+8GmZwhmVs+Q0uRivgb5qHDoFUS/BMg/TwFfDsVW3J9rDzBq642CJv/YYsFx5iKyF2sz4d+I7YKgBY3zNPBvmzCmcqqKQTkn4GGWM/qcSjt3aVU4P/4VCERZMJXtbXJoc1kRVhqpYR+jhY7rF4RpGpYrPf4ivznJx9kZEzKT6JzoaVvmzvdayWTo7i/9qBOTLdSWDn+zomDoT7ZhIhvvZVCL6DZtTOPbMRR1/WqOQAKxZKTQdBy3CnxZDp3SwJrQL+HWLRovSETp0x5xPS6Lrl4f/Ubi0MauyPz4plhnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39850400004)(346002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6916009)(2616005)(31686004)(5660300002)(66946007)(66476007)(107886003)(54906003)(66556008)(316002)(26005)(6486002)(6512007)(6506007)(478600001)(4744005)(4326008)(2906002)(36756003)(31696002)(86362001)(38100700002)(41300700001)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wT1YFz0ZWYb5C2McNK6CRQABVTPoAviyD9JW0Z27qJp66E7FDygZS/OTO755bBHNTUvUx5x9/FNtYpqI1tt6gzUcRliVYzBl5/0YR+7AsCVsfxtg6b/PqBiGf+DnSaJUFxZr79qqai433Gh6wZxs3CT6kzWQvehxgz0Oa/DQbkz5DFiexuvTe9t4uEc9hJtg3867OYPTLfN2ls2rz/GAwq2EWNKx/i2VOuVpVoG5LO0C96Iyy4eLsw5bAL+uUbzR/I8to0uTGQUU4bDuzfq+2QN2e+ML2Juu/1mgmF3zF68IopWd4xEBVELxIe3TGD62To3rmVb38HdpkC4dhqeJJx8rCJarZrYZ6YaHg3CtUSp39VUfMzscCp5KT7CLCpRvhoG/pcjYRgvTIKKb6e73ZpKce6pOjh/Hj/a1/yH812k3tRTuJljGDsX+N+s4I5fYtQ+KCRb5WRiXJ3enMdOxOvwe11QNMCHWsDryeWzgDmMkgdSihWr1HQh8KJklztnr3oZL8gPYhPFIaijKYor3hkVlQq6gpKcmcFAUOb12DHj3nKYDZ/dQo8+Ds3QHS5mabCsQqj6TO1M4fYxlFprnx4FNmKaNWz3rUexUon0sqIUNnwAedJoVpx/pOIv+Q/bx3Ds89Txvkb9ki3Eo/9n3Ib+qIWHpH983OZ9WOI3koS/V+ldtMjSQPvasSVtjLYAW2qaLgZCZm2PEiU89TYrbGKeurpaBA5YdbDjiZZUm0VmHY8seV1k3XKg9FmamErjyAo7gWKukpOrX+HqAyJubgRkCdXP4H2a2Gg8tEoTJdeIQPlj38/r8l/8g7pASe5PST/nor1I1UMnqGaFVJzSGFDM7FnKIqWf2KUzcF5xMActOzIg4GOPNQ8JidIobaI1uOd1CmdpmotMcHA6BdKh8YuhyXLIMRavgneuRulGD4EtVC6ozCwSnVl7lSfSHQzTH
 tEBi2WSbHPYMGmjIEaYotlEmakjA0C8CdJDURUz+8pDhjTaoZelODpVsuJ4UkINpGKQ+QYLKXOUTChXlqzhDg1QqXrgYJdXlJF1Vasjk8mHoBG4y0KjbH75/LaUyfeCxlqWc6atnkWNs1u9B1TObBHnXwWbiJiHBo2ERUmBqY8tvHj6sT7pQVQWcgADawpLBtsX1S62p6nCXRxBo6KsMCIx9L1wO7AbD372U9bZvavZKyX55G8SuO9i4Dh2hzUt6wpXjDeSZviZ3q6rutJerHzq0gheC6NHWzPPMymcaDO87a3Jbg4oSedmEczobov+WY45b+tfAEaLsbzXRDGg7lEl4Et9ivCQtaeD78q7bm3b+J2wjYiLBLi+7A5X/qpWc7C7XH5yZI3wd4VphFJmrAPWjwywJVIioqnc5JO7HOjo+6LKNjTURC5Pr0WBQ5WYmhB0msL3gI4irL21XZ4s1BAIfDdOb72d1JttkOGUDe9+Dv+v7atYTogFvRpgGitVD+6T6uukGbyX8mQDbgq3R80aKbz1uEknn3PkP/yMoOGF55p6TUiLLiiGj3QIx9KqSGDPrt4hJMXWRljJ4D2ZWr0tCjsoLBGS8GzOlWecZNJFmhjKPhEYlGvLv8So9fJw5z6sv/AaYYEdvxARnPGMTuA==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208e472c-19a1-4b0d-641b-08dc1c17c959
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:32:46.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMs/KEUfzb1x7i69OxnRv+gwVa5YzeoFvBmELHxTy+19Jk9F2rOCBW/EysL6cgPLTlVsN+kDQ/X5+ztXI4x1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1586
X-ALTERMIMEV2_out: done

Hello,

How interesting to upstream Linux would it be to have a way for Linux 
kernel or user space to pass a device tree blob to remote processor when 
starting a remote proc FW?

For instance we could imagine something like this:

1/ user space does echo -n firmware.elf > 
/sys/class/remoteproc/remoteprocXXX/firmware

2/ user space does echo -n my_dt.dtb > 
/sys/class/remoteproc/remoteprocXXX/dtb

3/ user space does echo start > /sys/class/remoteproc/remoteprocXXX/state

We could also imagine that the kernel could load its own device tree 
into memory and puts the address to this memory zone in a resource of 
the resource table if some resource type is found.

But I think the user space based approach is more flexible as you could 
potentially specify a different DTB from the kernel itself.

What do you think?

Regards,

-- 

Yann





