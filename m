Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B340BCCD
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006624; cv=none; b=t6epMK89PuFCW8OoVgoBMJSPq7ykh+i0N5SwRq8QkSf2s8pneEb8Syzec+MV4XO4LSwfPa9upMOBWWhfZcPk4H/u5GCiZedMoev6A6gVeilsGfC4bMp20T3AhlRuvwqMABkFFqEOzPciAs+1zX/UYPKcPI5fi3zRi1ga/lxcliM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006624; c=relaxed/simple;
	bh=HfvR5gvfgsOcrHJ3L3OGl/zGy5KibbcsIuOZax3I7w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S43YzvrX5VTNbdavPq4/9kc++vJH7DLzHg05szw0BHFVuAX7ciiKldiLww2wdS6mPP78L48dFJB0eS6ZRGeP2gHtSaJgjdIiZmJoTMxFgE04a8ekJLtQF378u0aG39xvv0G0KauFtTbGjbT7uu+WRkuOvhalz1RqjFOeW191uSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxoC9Ezl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5t44r2Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxoC9Ezl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5t44r2Y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnGob2491030
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 12:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2yOM2NAjtAyFgfFhbJW5TqogRr+sQYkIoqann+cFi4=; b=BxoC9Ezl00y3ZCc9
	V6RNTeDCYrLxnHn5u7ZXXjKT4JnD0EgVuhlR4G00zRngdGw33S2w9srfMOuBkcaG
	WRpFzJWsFNLyTNKiyxW0Dha0ail5foTmmkZ0CC8U6BiWF/nYWr2F0hIKANz8T7kM
	jJgtD+3gVE1y2W/4LEVIs188XujqZt+98a+NohmZMUfmBe33rJIOdv803v3qisB+
	UaICFliMjPL/7Wo8iU9rf/jK4EynXDGN3mggxMvd3Yn3tDKMM76/wQ9ibsJRno7y
	TAmCiGjXOMho3NgIuuEcmCqNPu+UqYBWoVfsiVY+63RxMxRJF9yuPYgCglJ59+al
	vOs2QQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds9dwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 12:03:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59c5efbe57bso336145e0c.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781006620; x=1781611420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2yOM2NAjtAyFgfFhbJW5TqogRr+sQYkIoqann+cFi4=;
        b=g5t44r2Yxp3ABwCqoK4hyF91HHK26M+5ziG9iRld25cqucLaEWOZlbRILWSqM9SBNC
         jCDBS55rgycn7ZzCUAcQ6MaT/inK9SefCkuVTleosEZe6bjxvOcjJBFiOiUgKsjhEruM
         z7AEoOn6oVOvE6+sxVJXazmGUrAR5PQk1CYF/h1s/NfvcjwK9sTZWs8VFP2PXBW6HyxO
         DyzJFBJkXphPGMxXQfu37lVA4xOWL8I/2xm0mwVd+Vw5zzMPq9pMBSYhHBCptvbcywCI
         NstuT282qr2zdxPdTOMFyzqDKLL9lfJ2WfieS5P2IL3iCiPMhr57Rd2u7Addm45ZdlVw
         55+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006620; x=1781611420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2yOM2NAjtAyFgfFhbJW5TqogRr+sQYkIoqann+cFi4=;
        b=h3mq0oToByIjzNsNJ5IQ2al5xhafYFeeT7UexVhgSBz5UiNEkJo6O4UfPrsVo4LWjz
         KXd8j4VImTcblSz3loEpqWmB4t3J5HZdzH0sWmW+omNTdaVKsF953c46PSpL5raCJdJ2
         UxmLpIIfHyX9oytlDFGUkjMfFf35vQAtpCwLv0NM96uAsg25a2i+ABxruUCUFuc6/vGj
         zSXH2gnqsZW01pwuhv2A/QLGWfQCqVy7avuR1/Nt51ikKvqYdnChFAeUxJ+loiMsCiv0
         iADSOZTjfnydcVfE1euvGqRMHpQ2gUErevdWbBzQLWaGaUvschdCZ7OVplcSB4AQE/YX
         Eqlw==
X-Forwarded-Encrypted: i=1; AFNElJ/kn7RKyDdcCqwO7ULEvO2UsP8DSqwokJmq7i4bJaidxDRNEIa6rMeLY9S7EEz1HDqmtPUyapp4+zyoibbmvw0m@vger.kernel.org
X-Gm-Message-State: AOJu0YxU9oZfW97rdZsMrgZK0qvLZwnUdO0hiznNCy/hZ9SAUEqthc7J
	0pUN8AMdK+qzazZ+Co55IBgycbLAVEcasYZTgTl2ngqTrD3+TRU8VH0OR8OfHawtXMs1skqEf5O
	NjMK/dT/2IKSacZmvmSxUGvuMuwgf5JLuFVpgCrADm24bjxJJxt5kNlR97UrqjPzY87Ksnxty
X-Gm-Gg: Acq92OFXosW5DvA543qjROzw4QwchPQZqVxOB381dAxnebYVy2ak/9j5xQ/zkqPH+/e
	2R7QPJqtbysNMvbZopbHncbEJfrSBZ4RVPnU/QhgEG+AHB7hzkZZpAPBXfTMLrrxOozYxN7UNXT
	jKIavyZC1AkjfiRFcly3lyt/JvImUarggjGHJtnXhoD4z9Z8U+kyqtICwRZRoSu17UkFmWQh+s2
	gSRA8yzRnInickaxK0EpQ5RiVK9LTKGzDNgCS+BjCmPlSqp0o+lIuN41RvasprQq2vj58HEIx40
	zjg3R8QdvNsww1ooqs5QimvotSlda7TvbH22Lfts9vFB2BWAGs6BTF4F3EVRjqFrqArXmdLHwvR
	KnMgzy3GIkHHnblkyYa6TCSgNITAL+bCZNEC1jmw0i5Vv8jHFsBYf6sDf
X-Received: by 2002:a05:6102:5a92:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-71913522647mr343132137.0.1781006619730;
        Tue, 09 Jun 2026 05:03:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5a92:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-71913522647mr343091137.0.1781006619215;
        Tue, 09 Jun 2026 05:03:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e29c0esm8716512a12.7.2026.06.09.05.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:03:38 -0700 (PDT)
Message-ID: <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:03:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V4m-Mres1HtNyh5qsIKEPmfPxbKlmxnD
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a28011c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=x89XBY5VHgNHtdzuPNgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: V4m-Mres1HtNyh5qsIKEPmfPxbKlmxnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNCBTYWx0ZWRfX0pY2LqwjGZx8
 CBc8qscfemArw3PsAocaZlglQgFqnUF8Jtaocj6dA75oF3TpEnWEx1uJF+nHfaioWyrOZWEpZrc
 a0P9kQh1zIc6TdGPN/cqVB8BIdAIc4ItqiWTpt6PmX7lCOqCi7oQOnzGD/+RRlUxumbuy528bsT
 HWrO+oahBanQkvT6og+Tq0TRLnykKcLBBZos98+wfsBjuoZfzeAqn8YCubULOCDMIYQIuHTo/eA
 QfqPhS5QDHTtv/JuMeWoWvyoErSsBtQL2/f8p91g3M2qu9f7oaS9fdqXId9c55Gz88reobnmifs
 evuqy6dc5o3jln0QH1mDkGMNmiUq1mNG+YpMyk3XFA7cnOplCUWZMj8WdP+PszGXgs0EYQNHHBp
 j+bdOUt3g/vf71bxY7You2zkNCQ66JInWgYLlIZ5LauvI9lLOC3OGMs1ZYzCNkpUAuOGKo3TDFZ
 Lrx8N8rG4syBOgaxVcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090114

On 6/9/26 12:22 PM, Gaurav Kohli wrote:
> Add support for Thermal Mitigation Devices (TMDs) to enable
> thermal throttling of remote processors through QMI.
> 
> This enables the thermal framework to request mitigation when remote
> subsystems (modem, CDSP) contribute to thermal issues.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

There's no other signs of Daniel in this patch, please fix the
tags chain

[...]

> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
> +{
> +	struct device *dev = pas->dev;
> +	struct device_node *np = dev->of_node;
> +	const char **tmd_names;
> +	int num_tmds, ret, i;
> +
> +	if (!of_find_property(np, "tmd-names", NULL))

Let's use device_property_present() instead

> +		return 0;
> +
> +	/* Get the TMD names array */
> +	num_tmds = of_property_count_strings(np, "tmd-names");

Is this something we can stuff into platform_data for a given rproc on a
given SoC (for which we already store *some* data in the PAS driver)?

Konrad
