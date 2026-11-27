Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771724;
	b=17bw7WZAjRwIgTfZ1knP14naG8JYGT5vMKQOijrBooitg93/K0D5E4h1YARvEaqeF8ve
	 oKxQPWLp6GDO1t/XBNxKZQRPUwtxc/ero98M4SWSUJVWAsuqmWlXPntPRiCtK/UmTFoe8
	 89xv3TwYThwU2bmYGL/nZGQja0fd9oobKrnHfNPTCUF39ylA4vkCWp/kqFLAGVs8M+5S3
	 Ug71pUXeOQ5FFHhSaZoBqvibfWrWMiDgxU5m0mZl46FO91qx/0i+a4HvvLJ4eqiQNeI9+
	 JNzgP+At7oPTwkEVI3FkMK6Sl+OpYd3w2aqhov6FbrwtsLHvaP5KlpHjcDRIK65cx6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OL9rbtESSgwSWVfK1XNXFtFtBgJaq0gp2fPLISBcSjk=;
	b=c0QcgQvifgpA8mrjgOXP7NxgaZuZWdS8ygTzO1q2JSrZIX5kiYcq452Mf5X9+JAAyqP2
	 klLe3uUWC9LuuIrSE4Ju5VMtuTcGfJOPR2tL5jaZvbPx3PmTprIlZ0z0pFYNQj6qXyWrF
	 W+8OOqFtSHRYO9rk7DPb/IHHeQrq7fqWyP0DKeST1HNueWw+ZJ8BTJTup3n7y/GsYMTNv
	 nAhqqKaE9gavtDbST8OMuwbMPyZeMK5boKR0DHX5TTlb1HZKM261JeTFgTP5vbsEgfO69
	 qQMB4lbFFR1SOFggL3/W1IP1NEyFdiBDcqzD5HcScWbfRWw+dqIeEY/RgFhhmvU5nQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1TJkJIS;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE2606A326
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1TJkJIS
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4331470c88.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771724; x=1796376524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OL9rbtESSgwSWVfK1XNXFtFtBgJaq0gp2fPLISBcSjk=;
        b=s1TJkJISXewQmUpUVQiIHzHlybd4cEGScZ7uhhzsXXHCcV440wn6WcsiLt793R+Y52
         gquERBUFNVjQsL8WqpRAk6ESNpW/3bqBqVI2VVbyz1PeoTq7Zq38JC8EE/2ms+vVh4yi
         hcA60n5Pw6kPtwwgkuHmhLxUChjNKEgagUfp4dip1W8pzAF1M9cpQ18yeivcleY4y4qN
         do/a1XGC2jNb2MbnOOSQ514ga8jUjyDrGYlIeW6FiHaqOz1apeSQuZwXEElNKjpGPIUb
         zWgyU5yXAkOfPXLqsLy07SVvF/tVXfW1wDg/GxyW5unBE9Z72w1lP3OKSKW/+KszPa/k
         OOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771724; x=1796376524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OL9rbtESSgwSWVfK1XNXFtFtBgJaq0gp2fPLISBcSjk=;
        b=U+fJSZZ2EXGoZqESIRp1Ze+q2qc5YJDcFC/cP1toatbIKejbJ0XA/WsCTiYsbMVXUS
         F8v0WXEEdfn5BF0ecsqIihIrAeha5XHiZFl7PB3q2XLecs3XNtbi82D0k7jz0nyenuID
         XTy/zIqIDkxjCWgjpu9a7FA5vYimqLCcoBomG9VB1jVitD6hyTqRn52MYsB8dZFiivnV
         HztPr4Ox9ekQtsRMMcPaW9o2FNzX6FbcIrfEBjUpjlwhi6U38bn6kTRUKVHzUbHiTkhK
         bQ1JB4TRoGscazbEx/q3Rnlpd2ppoFXyzO8t7e/qTG0r4NMrglVMKyJQOqMQfxaPMreu
         UNTg==
X-Forwarded-Encrypted: i=1; AL+hErH1e0bHBCQf0WcbSxdODGjrJ3Omclgpc4JEb+1KMuBrEqRBSOMi78gzz5sMi/HtExlahrHbInC5JvNb46Moq5/4@vger.kernel.org
X-Gm-Message-State: APuU4Z96FQhISkB6Ht80ic1uJEWrRZHcEWE/fNeksYBvGuKRIiJge66U
	47RRTZ6U33KhLD0uxuyaf4Z9vR/17cMo9v0ufoyzaHON0jns8OkCm39P
X-Gm-Gg: AZFdTZdF+oj8G6mSstbIdnkObQbJDbCk3Kslw1rcBNBoeQuj8Zo6VeEjOCMOzckBzGo
	BbsPzHWOuEtjxVMkJEapJj7cRWLnswhUPuCHmVfVvAaP2AMxhFHfoZ7VzwfQi4l0eMb8uCoqZnS
	iX7edI6+CEsaJMBzCaT+2Ag3+T/QzRXSFb9wa4Mmt6dTjsw+VYvWvZSUV1ZpbUBRg4O31KoJji6
	0o0pNA9y6560ikFsB7bGtdd0LCVj1mBeqm0+FV+DAmD+Xcmc1+mUCbcWC1Cz+vyh5Ugzr1mHLqW
	JnNkOMSdaEj3G7QQK4dnAjdL2ZG1f2yR+VzL7+k+HueuvfOkrdI4CAo6SQs3rJ9zHfMobcQcTNY
	L19xvI5mkjy57Bg+cAj3ytN0LG9CKVam1CX8K+ZHZuhc/eloN8Nhzss+o409GxONxCDxZtXwGyx
	uMu7btTLOCyc907NeAjbDsVAmuBClDl346kSQVCYdFACw4MQgA/63Y4ZXTVtBN5iUhXTfwCLKbX
	P71ask6fgEo7fKYRI5a5eDSyOnXXuIHKOykThAIYjqsqt9PKHsU2+0QTLODwB0XYzRHlwF4uGq8
	e+btkA8IICHhyNHoAjEz/4e/mu51qLpBeAceQsVd21Sn8fpunsUGqMJv
X-Received: by 2002:a05:701b:4583:20b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b55247f0e4mr22389092c88.4.1795771723614;
        Fri, 27 Nov 2026 01:28:43 -0800 (PST)
Received: from JMD ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm83505304c88.14.2026.11.27.01.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:28:43 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: gopikrishna.garmidi@oss.qualcomm.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	konrad.dybcio@oss.qualcomm.com,
	abelvesa@kernel.org
Cc: niklas.cassel@linaro.org,
	rohitkr@codeaurora.org,
	sibi.sankar@oss.qualcomm.com,
	robh@kernel.org,
	quic_srichara@quicinc.com,
	konradybcio@kernel.org,
	rajendra.nayak@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
Date: Fri, 27 Nov 2026 14:58:33 +0530
Message-ID: <20261127092834.731-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
References: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2026 at 01:07:50AM -0800, Gopikrishna Garmidi wrote:
> The da_to_va() callbacks compute the offset into the carveout as an int
> from a u64 device address. An address such as mem_reloc + 0x100000010
> truncates to 0x10, passes the bounds check and gets mapped to the wrong
> place. The check "offset + len > mem_size" can also overflow.
>
> Use a u64 offset, reject addresses below the carveout base and compare
> without risking overflow. Apply the same change to the pas, adsp, wcss
> and wcnss drivers, which all share this pattern.

Hi Gopikrishna,

This overlaps with a series I sent on Nov 7 covering the same four
drivers and the same root cause (int offset truncating the u64
da base subtraction):

https://lore.kernel.org/linux-remoteproc/20261106184312.100-1-atul.akella@gmail.com/

Mine's still awaiting review, so happy to defer or let the maintainers
pick whichever they'd rather carry forward. Wanted to flag the overlap
before there's duplicate review effort on both sides.

Atul
