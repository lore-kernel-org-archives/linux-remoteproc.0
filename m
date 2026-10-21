Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577504;
	b=ornrdN3LVCLxDn58aJuLUroC3r9YmzCgtAASAplOTVNN5bAkY5H1uyyT18nJe6/LrDB0
	 L/vjB/vym/e2aSjvM+6mGMr7ZhzKSO7BiKK1ENgo95uC+UWV6Gmpw+IY5BLRkDjOwLYKF
	 sy3HREhhvTtD433geBPbpyv6wu7aa+RQt5vMypfwEeCLnMtbl2lDlUq4fDcOosf6sNFDq
	 hIo6U9YLw9E7b++Z+4tzM428BI+xmPGTny93EdA69EYrGaVgL5F0cApoxEktzoOgrJ4IR
	 jrvFYM8D+RfCMY1nhOEUMOpdsNtzJSb/y5y0J1bcCUA+5dZuYD5cft8TiwaD/s27kzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
	b=LZFQZv5Rq0pzQ6U0N0MSJDZZnikToilnrFQfOPf27RaUxZoT450VndH49ZLhHpfJIaYG
	 urJUC/9l2sgOSzqu8GKcrqhPoqOHeyjJ+J/oQnlV0v79ADs59a/rlR4lOeQyEOAGRoOip
	 fqKEkdXG1uJU4y37f/y7JfZFTsR7pNI9KtmQSJ/44OyY6Z2heLDW0uaEbsK/AcdfAVQ29
	 74Kv0Su9UcyKDDaJIoh2tEoFF7l0ZcZ44XSZVy+6PozeuecIHb0V8wAqu5kaDNUQz2Bh5
	 PnZja+s25x+baZEvCoYvW0ttH2VYqnARg/nTCY3DsK2cD6BvxPmUymv3jsx+2/4gg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JU0UXLZg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoOR4KpI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB26606A327
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB26606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JU0UXLZg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoOR4KpI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6DSO848842
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=; b=JU0UXLZgv/aesNL9
	DkhERiOeUdF/cM0awIlxTk0TQAcwRoizT4N457qvyLadUnIP1/z/UbdVjWlWO1KO
	oZduGNiUvcWIyhWd0SEXR/+kW8PDUc4gCmMeTGp1gNYu2A6VfbXx5+K3haslaoOX
	MYZb5Dcpx6LL9y2FL7+Du2E4WK+hrggO1Ll2XXAxGLSHtIeb4IvfHf253rO0BKYT
	MhJ2XDgKYiY0CZ9JvQuLITqLxtjnyoiRq25gCIubxUACcUq2jArwL5IRe1+7RbbV
	a8IepJPaBhxZESgQlRNUSLzebni4H7erhfughpxxGTSr7I3kanPhRBZi5lnWSbzd
	U6lNSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkdqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:11:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so11441185a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577502; x=1793182302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
        b=EoOR4KpIG5n/glao4kPsYKR60VJw3V+U8H5SnXFz6UUngX3xXHBMbprzxRq0JkgHMY
         N5MQCOywZ0GF2ytgG2xFe8eqoAEjRjtacSyvOKeLXPEtu1pmE28fikYN/fkvWja/GYgR
         yupNIvC8m4LtZxrWc64LI5fjjk+1mSnKWOnvBA5p/93dtHFAUsOq3dxN/Y6TkPOrVUUJ
         SbXU/CpFqMvB/MJRb1yc/WQ8zVJln/uabwKUOcWsnPSD4Yrj3SjnLZTESCAPgN0ASKd+
         hNjwNNyFwtwSddBkwUmzJj9zmCtLmRToEG968MPEhOVIxL/UR1mqA5b68F0rvozvz4KZ
         f3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577502; x=1793182302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
        b=ocVUdwkspE3Hnuuvh+LaHP7H8g96dCfHGIeXNKpFyot16iBu5xO88ZPt9P2ZRwW3pV
         9cHRH4fjnqxucHHxGNjPCjVvlzn/xwb3XvRJxsiPP3BnxLj7RGEdtavxWa8mAIr//J0D
         dq2OiaB1LAKTNzru4qF5DlRWWiZ84zo/BAaBebkZvZsw4MNJsQ8OQ//fbapksxq4sZO7
         GsQqH3U1B/dByFebFQbX5ipmlnQvFpIWyoJAipBxDsHJRbtujzkdTLC5XAi+SL3upST0
         BHaQja+SLuBK4+Q2CXb4+eJWmSiIxxoYO7pDyjkIarrSejAvOyahwxSlcNZfX4jwDoP/
         2flw==
X-Forwarded-Encrypted: i=1; AKwUvBwYdzEyL+fFePPQEKzSg5Bk+T1HpJbIyp0DFRC3GT25PfGJdJXKSv8N1G165BAeHF+jvGV7rKZw1EaTWWVl8g2w@vger.kernel.org
X-Gm-Message-State: AFq9FYJNdWbVmW7MW/TkPmjkaFVXNiGqV4n4XkI6UFql9q5vwNNZ6jFo
	CZ59m/cUiOBVKlcltV0tsEf79aYlWVUPXohMVGHRXD+ZONWLmoZzfsEgG1GMFhMMX5IJHSKcS8Z
	v4Y/PET9UxuIDJ7BrCPTG+YZPHLwfhi2mH4QsxSaV8OoOrVgL6pKgzVdWofR44/SwDjkAmVkM
X-Gm-Gg: AYBFou1kT4O56Pv+iOSIeD+VG2259zI+LUfc7dLbW0DwCgJz4km+mK1vG7zPHC4wnQL
	TqhOz1oqJdh6HYw4lT5horO33DD66YbT8jYRYU/r3FymKPlx3rW/LL3ra0URYwfYQCmTLJXCTJy
	Och1y6VS0XSfcE1Y6aLUNb8FsjoOrjvteDowmTtDnhZoBpTw7aMh0jI0lZ4zXXo4+lQ32KaD9JI
	hYAg1pLmZf2gih53LRh1x9dT4bf08dHvwkhjm3RBj2pJXVtnOJ1Kltz0+IfAH92yzDWX3KN5xO4
	BjgQ6WgUSNL//wWT7Y6RTGmW66sMQFlyLmRt6Wz2E/SluMieYRHLQW+dfWSOHuwQt8tM77eJnon
	eWC97gEXF34wTRMhblaU3ZQ==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr371156085a.2.1792577501992;
        Wed, 21 Oct 2026 03:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr371152785a.2.1792577501520;
        Wed, 21 Oct 2026 03:11:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa02dsm61960466b.40.2026.10.21.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:11:40 -0700 (PDT)
Message-ID: <c4f82514-14d6-4516-bc09-c735f35978f5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:11:38 +0200
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
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9nTBhv0ExkU8
 WotqCTsy2NCF11Z2YW8R+gNcDakj6G3fo+sqvOMn1T0f9wtQUee2MqF6DdM+pceUGb/IbOq7W7g
 qcja3oZbuvyQeSPD1Nwvz5uoTDJp7trT24LNBa3bDswMVtKZoSpv/qa/rHr8PnoFHZNI3arIgxC
 sgHO5oUKCIPZ18SIl9XvuffHAK8X73wkN9u8B/MD3esdfir2vvMVAxuHWxqz94Ge7w8YUcoc50j
 +RFofRHTZVGU1/ow/rtJ9Z7QkaYj1wGIJyNTZ/CE4Ql5qO4zYrzM/BSxGCVyVCrSY/QzNiGRxP+
 OEC/E+s2il5KTyYTCaSH1lZzKCjpjiQsrofugdsfPYg88xo4hZ1Fr34AL9TvpjzD9FAhAdxQP8o
 28tqz96GIJBdEeQpSoLNySv+d7uyzR5tSU/So3Ah5rZwBIxJuv/Mc0HTVwW7RvF0MR0f/RgyVcH
 CSVRUsmoDIHYqdXzCFw==
X-Proofpoint-GUID: kfqXHkxwKOM6RcmvhcFjL4Wo0U17MAA_
X-Proofpoint-ORIG-GUID: kfqXHkxwKOM6RcmvhcFjL4Wo0U17MAA_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX60GnYX5Q8qZP
 fzIMuxkIP7NeGTtOrXCArG9I6dULr8mfhVLlJC6avpfkpC3TUNTpZKI+Uks+9Hpmjv+imWvldLw
 yxwYNweYZMmYpzee0Bfh5TNeEUV+gv4=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad88fde cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In adsp_da_to_va(), the offset calculation results are stored in a
> signed 32-bit integer (offset). On 64-bit architectures, this can
> truncate the 64-bit address arithmetic result if the subtraction exceeds
> 2GB, causing erroneous bounds check failures or invalid pointer
> translations.
> 
> Fix this by using an unsigned size_t offset and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")

Konrad
