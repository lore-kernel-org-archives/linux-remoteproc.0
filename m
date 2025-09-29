Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F322FA0C7
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140204; cv=none; b=Ig5I0UQugHZZ25lpD1tEGzh+eDwbV4xMhjzFBd3uOagjfXtHpwdCt8t4R673fixCvaebWvH+X/S6WHiJbOPAz195d9Rtzf1ExjQGaK8qlmwGvY+X5LbF2c64EWiZ68RHUKGM0zsL1mCwpyy+b0mOklGBs+XkSXozGrGkJCOOxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140204; c=relaxed/simple;
	bh=vb4zRbPoWCVNiJSGPFPQY1JkB5ZYsuOuCoh1Ay5Mp/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Roq3Gb3tPoM6eHY1MIGZap+68KjDefuZFUyC4vBBi0OYUgdO+YUllhQdsTrbPlDcHhzSckKz2fOULov7r5MtwJSb6FzB9nsiyT8fARH7n8IgzKSxLfZsD8tBPwIL7XubXbKyAtySTUDr8VeL7T5VVpuKLtmhHX4XLeOxU5tpBWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAmWDxN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAmWDxN1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SM6xs6001866
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 10:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2xu/IuB6UpN3J5TmykYO0LnsIFMlTlgxYPOo4VkD0U=; b=mAmWDxN1tYeIhC7z
	xKjhEN64GNh6L2NLd4hMn0em1lhLcq5UI3dctz/eCUrCRh192Znxno6NPuqjtWd6
	7WOgseRI8AOvihEq9xVPtE4s6TlBlMU51KaMSZUArH9h3TTNRIky4P4+rfIp8u7l
	86Ze1YE2591IKdLTo5L2oOpeaceSQYI9hmzooqd9Xd9r/aEuz5OhROyPl8t/lC7W
	wowZXVdogn/8qGbovfOdiKV+hwre54UtIvPkihwvr5GdXyZ+gg1DUMCUa6Wnse4l
	QButClLNZZeEuXskrQ4MRWcaaECSu3Xsiwk43+JDd0ZjTQFsNlUU8ByCndCUMcJt
	SGawDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5mtwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 10:03:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dd6887656cso79754491cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 03:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140195; x=1759744995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2xu/IuB6UpN3J5TmykYO0LnsIFMlTlgxYPOo4VkD0U=;
        b=iHmq0DezgMvw2QWyWVpXvPl+qQsgokQd9OLhk4AW884eEtTWihkUsgBQnXDNR8iYtw
         EXwgQ8K7u95IK0FhQym5zi3eJ7r80fI5wXdiFKHwKKzSe5r7n6cVftcsR5qqG3/uR+To
         S9mVVkJ7h300+C2jAa9ktET9egKE8Ozd6yo83OyO9N43MbxIhlspsoqz5EskjjFO5Pmt
         Hk+GDo/P+Jd2vLejZk6WqYxkDxe+I8oOozmTYCDsPAROmt0KpaVJ0uYYwbq51v2pPC7R
         XydlMiKj0UTb/eMcjBRnFnQfzlaMZLBN5v0Gw/VCSKYKWCQahbbisJ0TwOzXRRsDu+xX
         wjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0KAQQHRYtjih3Sj4yrd/NBbZfZMSXJXkXqIP301MSoxvHy+CswzTcRNR9dtA0PSA3BsNqH+i9Idmv1DvHpxD1@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8Ccrws7ir9ZEOPE0VeOZqCSfwXdO/2jJTl3HrnJM8k/7pBoq
	QY2gMCvcXM86OVVOuZtCdrkDTdSvhFKgsOKlyCcWiKXUKBfoPh1mzeXl3qJCGfRx5BU0tVYFZa8
	ZNnfurSffaq/2ap/aS1p/yEDddRpP7gOs7WsjOQ2mNJ86yX8TXP2V9Oo9+mb33VYz4prb4yk9
X-Gm-Gg: ASbGnctKXmhawCZR9yQFqtyC+6PLSWJOvQ/rDRPOatrMP8h8i3TdRtPfA1tCCDiZkyl
	W4zd77jQ+an0nXbjUTn0DOpXJ00Ph9QiO++x27BM54MmK26AlAOqL0j95E5oYdJW17D5dKtDUxm
	TMF9Eslbtx4R45Gmujq8XSQzfzbDVgFizT+LGaqkjRAVs5SJVXrAurLAk3kwcSezEeKP1bwUmxY
	r6IiMZ0CbwYcoDsucqV9xYjHsnsOT+0XNTvfGVFt7hu+F81eIvwNU8tCpAhyemA82yh7QFqnnUZ
	uAFttJn8m64gnq0YNDlYSq/18qq6UCK7JX5NlpYmnkHHNObSh+JTuEtT24NS8sjbiUCcmjpiPTT
	sx1hHS8Tpte8C6IfrZDD12Sos+TxKhrSg/19oSnygzFdVwSYOrT8X
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr122888341cf.64.1759140194775;
        Mon, 29 Sep 2025 03:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2+q7FGGuMsvCVWTzqSjun2cAUChShlnzyln/aLfDIxQUWXJNULzrUScBN2u42qzJl7NWJ+A==
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr122887731cf.64.1759140194151;
        Mon, 29 Sep 2025 03:03:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd679csm4031856e87.56.2025.09.29.03.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 03:03:13 -0700 (PDT)
Date: Mon, 29 Sep 2025 13:03:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Message-ID: <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
X-Proofpoint-GUID: Vx9rW7MLLOBeEtYFqzAyath-EuOcEHS1
X-Proofpoint-ORIG-GUID: Vx9rW7MLLOBeEtYFqzAyath-EuOcEHS1
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68da5963 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=I1Z6VqxiEuXI--SH4ZsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXxAQOHFmc7pOn
 /cDVmtjq7CTBOeI1aisx9LNyMEnzoaivJ0ezJ+nXC88qr1Uw4BGCGf+AzBDSbI9EW8V6tRTVo1G
 7bBkDiysIwC2Vhp/y+V8I0H1ZemsQn5TVa2C90wllmMn0chvvWPgoh/IzR0AIyMSU3cqyq76HB+
 Q8+D9Xn9lg15WkE0QANO8T26OHg9BxIa7pFwIWAqkxpHGVzr3pi3GWiL9yYT67gXJrFFdck7Y0e
 U6ZlGjgyeI7Adua1hjjSqy7YC89gg/S0AzOrODGBA3Qiz9PUv1+/f+V4O8/ajSB5spB385SlUbQ
 QDhA5o6UcfVEpaEqz2lrCT9AudlxZSLzC2JpgQhz7np5PlBUn8W6YFpCMuOZwHi7/v2Ri8lUksA
 ZLGQC9kAqfl9sfHvm0aG1L5gD860LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
> 
> 
> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
> >>
> >>
> >> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
> >>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> >>>>
> >>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
> >>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
> >>>> interrupt.
> >>>>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> ---
> >>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
> >>>>  1 file changed, 19 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >>>> index be9e2a0bc060..031fdf36a66c 100644
> >>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >>>> @@ -35,6 +35,9 @@ properties:
> >>>>        - items:
> >>>>            - const: qcom,sm8750-cdsp-pas
> >>>>            - const: qcom,sm8650-cdsp-pas
> >>>> +      - items:
> >>>> +          - const: qcom,kaanapali-cdsp-pas
> >>>> +          - const: qcom,sm8550-cdsp-pas
> >>>
> >>>
> >>> This time maybe without HTML:
> >>>
> >>> This looks wrong. This is not compatible with SM8550.
> >>
> >> Could you point out what is the difference from your perspecetive?
> >> it is the same as SM8550 except for there is one more interrupt,
> >> which is also described in this patch.
> > 
> > I'd second Krzysztof here. Your description points out that it is _not_
> > compatible to SM8550.
> > 
> 
> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
> difference in interrupt:
> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/

Interesting. Let's wait for Krzysztof's response then.

-- 
With best wishes
Dmitry
