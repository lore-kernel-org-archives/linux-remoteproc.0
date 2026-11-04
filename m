Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779655;
	b=TOsEq4B7X1zxrxViPGsItlFzmNNp0JMKinw2uAChLvT2+fygpgcBQATfw2RYX499c10q
	 +XAE8fhyCdpmIHMo9TPAjM6Hdm1VyQKdL1Qdmr7/Vnkpt30aB7N3A7eDv6JK2TZHd039j
	 PqomLRNT0FeMPEQrHvgatM1vZel8NF9jPHOYpSKCU4W6fuXBFt4MgTlORyxe94Bzfmwjj
	 b6UknXtKMmRfWBqPOOxavV8v/xlZvGo4OsnFIUL6Is9rQWHxkp/knEdid+IfYEXhwB+7C
	 DUGqUq/LqZ+VFUd9GbiRC4l3rbC/YS+nTK8ZiGuNbx/F8rkxaf0kzq2Yj9zy27Le8cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779655;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1wbEg7RVw0sJcgK6jo+VuHuQigKauy2ObmwYyN2iIwY=;
	b=nA/F6mSxciW3WTdt/862B7aeEfoPE7ubISRgS6KUB4c7nHpCXHwiA4VBuZonKZxQY1Mw
	 BJsbkLWAqIPCWfDNNyL5DDx1vY/VgIwgbWT6n9mxh/hvO9w5jjh4RkA20WPutMfs64c/j
	 uIPw2sUthuQzXZypf193umwUFVo1w0TFnCFWJOsiII7RlIcZgdhe5SOtaHXAgaqJfDsmP
	 SVnHThUMQgHz9gKb8R06jHcmMvLhdr0DHARd+njJT40l8BiCBpzx1UgsscQIgDbZiMUW7
	 HtE16uOCOK4XF1oarEav8NUENX0/UrAe14Md5Azs2ntDZrHO1Vn7MMPiBD5a0YKe+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=KMnS60ME;
	arc=none smtp.remote-ip=91.218.175.109
Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B169606A32C
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 08:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B169606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=KMnS60ME
X-Envelope-To: linux-remoteproc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Wfoa4J0AxWSbhy/+SsM9gBeiOJtqslLCJgg5kOlOSg=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793779652; v=1; x=1794384452;
 b=KMnS60MEqfOkGV4P9k+fvGDemgfC87OFeWgVyZ/bS1FRaRvfngRJ44sdQi/U+VglGiIcZ8HM
 nIc9ZtgM4OorNTcNDGf1RJByLG5HvXRlhxjKvXvooLJdYS+dw43DUal8k13RASDSWKjc6Thk1yo
 b6xEE6+qNoSSVFolE9YSBl/98xfGnggGWvVKVP23W9cWC/WuRuADPcsodEa2wMJ6GZmxvI9Odrr
 bkbdgJllyTQFZf+fQvHfJdnk7xRualHn3CcgnTurokwM4qIDELCaK36xH/x1ys1S6qGytwMy/3Q
 9sTAucR71k+1FgevYJiYjkIubo9HbPyTTLAJCfshPxNTg==
X-Envelope-To: linux-remoteproc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec92a9e29fcfd0d0;
	Wed, 04 Nov 2026 08:07:31 +0000
X-Mizu-Trace-ID: ec92a9e29fcfd0d0
X-Migadu-Flow: FLOW_OUT
Message-ID: <4953dc2f-d998-43fe-b02f-597d5d7b23b4@packett.cool>
Date: Wed, 4 Nov 2026 05:07:22 -0300
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20261104080200.135431-1-val@packett.cool>
 <20261104080200.135431-2-val@packett.cool>
 <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/26 5:03 AM, Konrad Dybcio wrote:
> On 11/4/26 9:01 AM, Val Packett wrote:
>> The SLPI on the SC8180X is identical to the one on SM8150, reuse the
>> same data SM8150 (and SDM845) uses.
> fallback to 8150?

The current binding for all the remoteprocs (which already mentions 
slpi) doesn't use a fallback..

(in sm8150-pas.yaml only qcs615 uses the fallback right now)

Between editing the bindings and adding the compatible to the driver, I 
chose the option that was consistent with how the others are done..


~val

