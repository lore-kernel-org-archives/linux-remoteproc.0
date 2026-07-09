Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACD3A381C
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576526; cv=none; b=l1GeHyBK87v88HTivHULhVN16atFO4lN6piLF44zume2funT1HTTwZ6q+EQD6u4h0F3otb4uq0igQv1MV/2n0ZCdldYYnbZE6nrhS1hNjtzhWuwsgW2us8HTgAvoFwuIgm2dugFdv6jIUxcXUVp2CMPOArp6HEB06gVGFFJx2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576526; c=relaxed/simple;
	bh=mQux9bAenlDK11PX8bV/cumoIW+JAjvJmcG9schhrUc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HTDSK1DkMGnCAkNYry9Dfm41Hub1mfo35Jy2QOjjG/TFj0hW4t9uJwoNUMlWxTtaDhwlQQO/k5hZMBbp0hZoDq78XE0p94dSdOlNkcK/Yy7ZjX9yl7smrG+UajXE/rU9iRjB3cX/wwcXlIZPUHX0cAeyhPqNZdcghuErqLgcx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5x1AXfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElVM06mT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5x1AXfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ElVM06mT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6693k1kW636714
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 05:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FhovW18vcueRupJR1G9S2X38dNq/CQkczoYhUqon8g=; b=N5x1AXfympv/NUzf
	FTA060YFNUCbovFYC+Jc7Srsr80gfCuwJjS7KXylWdz3hILOFcCQpDAmhliLFRYZ
	ctLZOgbpme/de6jmwOvFWoVd+H+dXt3xJEWK8Xf2PBGIixtXm3tZbOIdQZ+B1d2e
	j0n2NOEdl3rUhrFN52+19Ey6JZlF8gbQd8mOkTrvwJ4x7Yo/svEmYUwocgMbtdQm
	WdEeF4PvfSjZ+aDjS0v6Wbi9g6xHWdihBwu63mJVqwd0v0jy2VZPESl3/Gi0qY9C
	YyMnbtPOOGdoWhl6Snz5SIBEI6lSTj4c7jLgJHD3SCDrOTHEU2ovHdSMpPQl4I7d
	KlfrkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418gd7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 05:55:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6bbd0afffso11116135ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 22:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783576524; x=1784181324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FhovW18vcueRupJR1G9S2X38dNq/CQkczoYhUqon8g=;
        b=ElVM06mTZSTXGNaCH+po3H3ib8cos0q9nl6tQkDNDm9hJ32BguX64nYOpgJaZft5Kv
         sICRBTGHs9pePdLIRYJi2SGDTrdclUc0arI0jdYsEYUfL77z+qfW/TcAhulLoUVg4pA3
         YgLYqwtwryIYfgVq1QLSofV7v6KnwtPpTuJ4XGW7xIUkvepG8HnLGvY0D7q3Rvc/nkfB
         GtNbRY7yqLrRQjUf9oBKDi85gjrQES2id+s0f7WD7mkTGqUByFDVaDheC4O3H85gOaDf
         /YVaCkMJarUc0kEAaEBoU9FWi641OCS9FYcbDWUjy9V5z3V5f1kRNeZLrOtEeESPtFzJ
         ENgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783576524; x=1784181324;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FhovW18vcueRupJR1G9S2X38dNq/CQkczoYhUqon8g=;
        b=pVrPs66F6T1uUFIknGUaWwIu46Wq0Kt+EYYaso8XW+DmSO7+zhqfpFTlxO28DuqqwC
         QYagQJ4XDN4OLyJQTMUJ9X07B/J+OmfEBpQtx8rZgZbBCag+0nNn3o+FAsmW1UnJ0sXq
         io2hxn11FESM896P6txfFPxnx+VHm/F4pmNWD6GtId9BMcGMf0dNCrrinudJemJvpQjg
         b47WIKTC74jYwuLITQz4xIeziyhIg2NLErf0Sf9SOyiPtKrn09UD9ygI5JpZXHwSGrT1
         TbGyJNFlbpNjwKNioW1oj8mvTHhgPhr0uAyF39ysgZPFZcfpCM5WSsR1DwrBNd27SHPG
         ohvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqzh9J5tjcQJ7WNKD6mE4yB6MiYQmqdZv4Oby/HflxZXyqmbYOV+r79gewm+WMPFfotov5C4WETirSPX+jP7xm9@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQDeBhqYYS5oqSfZhfuC/L7ry3PCOTXW9intG7B6zKz9yuLa8
	pfwjaJAVJwSGa57ACD/zV1aOxcmmBMq313Ek4cylO/JnApMfzaVb7IwWG2Z+MWnSKjLuX6jjprq
	NDDDv6AiII9lzvoQrf5APOkjROolnHjB6yRbPKZgSxwlhWmEirpRMPPEzU7MH+DToR73Uj2D8
X-Gm-Gg: AfdE7clVXWPP8y8hGcPTcZiLp0fjuaGJhnu2DGnj+n2Yk5C6y6DKhf3wgT4HWvGiDUz
	yH/4DzuhthV3AZdZKZ6eHniltVPRVr42++PKI8Kl6G8RgrHNBnk44g8C7PfO//gpavOr3UCl0xO
	2dX/LexWWoCM3q3aoqujG9stfnLUUe7+fc0ln8cFHTovC7fmvNIP2HrO+Z3p07va+zKCPaRO++b
	5q5B95cc30T9ESgTWdlujAchtARX2OUFuTNZ7xguizTOMJLEPnQNrckwwl4i2vbrmoQSMCNJfmw
	TIZs6swA6jeBP+HCaBOM1ky4f5nKO9YcYOGJFSKvpu0VxqSxSid2I+74XyZqxei/1K425DJntrG
	G/RA39UCSI6KFqcntN7ko7Wy2e2iCbabpCehhKxzqx2E+cY7E
X-Received: by 2002:a17:902:daca:b0:2c9:ff29:3f73 with SMTP id d9443c01a7336-2ccea45e5c0mr56146225ad.28.1783576523564;
        Wed, 08 Jul 2026 22:55:23 -0700 (PDT)
X-Received: by 2002:a17:902:daca:b0:2c9:ff29:3f73 with SMTP id d9443c01a7336-2ccea45e5c0mr56146035ad.28.1783576523063;
        Wed, 08 Jul 2026 22:55:23 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc1fsm37683565ad.55.2026.07.08.22.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:55:22 -0700 (PDT)
Message-ID: <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 11:25:17 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f37cc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=w873RiH1ZcoYVCw8PSIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MyBTYWx0ZWRfX4xj0jyqtBRv0
 6ErryrONnQ3KNmOsO4RsX7OwDZB7WMix+uQZgG8PO12aDiVFa5FvJ6LFI4Va3UiZyrloQJpeOUl
 tHOnd0R1jUX/zcPx1Vn6x1ZHEYY5hH2UXKSTfyZcwQxeOMvhsdiXU2tmV1lSzqDl+rO363oKUmb
 dTgjij8exBTI+g57+QzTUAZ0szJmXvtWaLRndb3XdfhXKgskfbQVxeO8R1qwQK0QpBBeZ938rZr
 K/J2Yh4jri3wOlKTtp+rueCrirGCNmkpWkIjOYMajhEoWf5uqyNRLJi2SJr2OUVyvl4V64xcQvT
 wIzD9vdcmI9MlrutFl2km+2Z5zu0dkh8Hklqf3MiOHdZolKhE0k61/qMYvlapxzjNcUNHlTeEZP
 lgFnXiWeSJUIhueD7vSHVMxNygaoMqVlMVfxwHsesyqqHVPF1JW2uRFPJzlyKxPx0Slo+P/aq6F
 qYi5/pDHG5uueC8Lpkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MyBTYWx0ZWRfXx2kUYIBL8eRM
 QlrGvUMz1lDTKJe0qrzlANwS8jQ0fOW/EErNSxgHCz351Wx3inzX5Y+WwGbhADpbMiKlyMA/g2q
 gZ93QfykePC4mN+tDyQsZMqXRjAxIEg=
X-Proofpoint-GUID: gXlwAdU6nOhWbovr4iM_p5BUJTFk8ray
X-Proofpoint-ORIG-GUID: gXlwAdU6nOhWbovr4iM_p5BUJTFk8ray
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090053

Hi Bjorn,

Could you please help review and pick this series if it looks okay to you.

Thanks,
Vignesh

On 5/13/2026 11:49 PM, Vignesh Viswanathan wrote:
> Hi Bjorn,
> 
> A gentle reminder to review this series. All the patches have picked
> up R-b tags. If it looks okay to you, could you please help pick
> it up in the current merge window.
> 
> Thanks
> Vignesh
> 
> On 5/5/2026 3:53 PM, Varadarajan Narayanan wrote:
>> As discussed in [4] posting this series after dropping IPQ5424 support
>> to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].
>>
>> Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.
>>
>> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
>> I've resumed Gokul's work as the last submission dates back April 2025.
>>
>> - Secure PIL is signed, firmware images which only TrustZone (TZ)
>>   can authenticate and load. Linux kernel will send a request to TZ to
>>   authenticate and load the PIL images.
>>
>> - When secure PIL support was added to the existing wcss PIL driver
>>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>>   This series adds a new secure PIL driver for the same.
>>
>> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>>   reposted from [3].
>>
>> [1]
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
>>
>> [2]
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
>>
>> [3]
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
>>
>> [4]
>> https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/
>>
>> Changes in v12:
>> 	- No code change
>> 	- Rebase to ToT
>> 	- Change quicinc mail ids to oss.qualcomm.com mail ids
>> 	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/
>>
>> Changes in v11:
>> 	- Add R-b tags
>> 	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
>> 	- No change in other patches
>> 	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/
>>
>> Changes in v10:
>> 	- Add R-b tags
>> 	- Remove unused fields from 'struct wcss_sec'
>> 	- Remove glink and ssr subdev if wcss_sec_probe() fails
>> 	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/
>>
>> Changes in v9:
>> 	- Add R-b from Konrad for dts patches
>> 	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
>> 	- Restore clocks & clock-names in above yaml
>> 	- Fix DCO on two patches
>> 	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/
>>
>> Changes in v8:
>> 	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
>> 		* IPQ5018 support added in v6
>> 		* IPQ5424 support dropped in v8
>> 		* Updated to use IPQ9574 as example
>> 	- dt-bindings-check and dtbs-check passed
>> 	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> 	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
>> 	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
>> 	- Dropped changes to ipq5424.dtsi
>> 	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/
>>
>> Changes in v7:
>> 	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
>> 	- correctly sorted smp2p-wcss nodes in dtsi files
>> 	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com
>>
>> Changes in v6:
>> 	- added patch to fix IPC register offset for ipq5424
>> 	- changed phandle description for mboxes property in dt-bindings
>> 	- updated bindings to define the right clocks per SoC based on
>> 	  compatible. Ran make dt_binding_check for validation of all
>> 	  SoCs
>> 	- use of more descriptive match data property (use_tmelcom) and
>> 	  added a condition in wcss_start to not error out if tmelcom
>> 	  isn't used
>> 	- mitigated potential off-by-one
>> 	- adopted use of of_reserved_mem_region_to_resource to acquire
>> 	  memory-region resource
>> 	- added driver support for ipq5018 SoC
>> 	- corrected size of reg properties as per Konrad's comments
>> 	- added patch to bring up Q6 in ipq5018 dtsi
>> 	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
>>
>> Changes in v5:
>> 	- retained all the patches as in v3 and addressed comments in
>> 	  v3.
>> 	- reverted changes to dt-bindings done in v4 and retained as in
>> 	  v3 and fixed firmware format from .mdt to .mbn and retained
>> 	  reviewed-by.
>> 	- dropped 2 patches in v4 that adds support for q6 dtb loading.
>> 	  Will post them as a new series.
>>
>> 	Following tests were done:
>> 	- checkpatch
>> 	- dt_binding_check and dtbs_check
>> 	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com
>>
>> Changes in v4:
>>         - changed q6 firmware image format from .mdt to .mbn
>>         - corrected arrangement of variable assignemnts as per comments
>>           in qcom_scm.c
>>         - added scm call to get board machid
>>         - added support for q6 dtb loading with support for additional
>>           reserved memory for q6 dtb in .mbn format
>>         - updated dt-bindings to include new dts entry qcom,q6-dtb-info
>>           and additional item in memory-region for q6 dtb region.
>>         - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
>>           Kconfig
>>         - removed unwanted header files in qcom_q6v5_wcss_sec.c
>>         - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
>>         - added required check for using tmelcom, if available. Enabled
>>           fallback to scm based authentication, if tmelcom is unavailable.
>>         - added necessary padding for 8digt hex address in dts
>> 	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com
>>
>> 	Following tests were done:
>> 	- checkpatch
>> 	- kernel-doc
>> 	- dt_binding_check and dtbs_check
>>
>> Changes in v3:
>>         - fixed copyright years and markings based on Jeff's comments.
>>         - replaced devm_ioremap_wc() with ioremap_wc() in
>>           wcss_sec_copy_segment().
>>         - replaced rproc_alloc() and rproc_add() with their devres
>>           counterparts.
>>         - added mailbox call to tmelcom for secure image authentication
>>           as required for IPQ5424. Added ipq5424 APCS comatible required.
>>         - added changes to scm call to pass metadata size as required for
>>           IPQ5332.
>> 	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com
>>
>> Changes in v2:
>>         - Removed dependency of this series to q6 clock removal series
>>           as recommended by Krzysztof
>> 	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com
>>
>> George Moussalem (1):
>>   arm64: dts: qcom: ipq5018: add nodes to bring up q6
>>
>> Manikanta Mylavarapu (4):
>>   firmware: qcom_scm: ipq5332: add support to pass metadata size
>>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
>>   arm64: dts: qcom: ipq5332: add nodes to bring up q6
>>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
>>
>> Vignesh Viswanathan (1):
>>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
>>
>>  .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
>>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
>>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
>>  drivers/firmware/qcom/qcom_scm.c              |  14 +-
>>  drivers/firmware/qcom/qcom_scm.h              |   1 +
>>  drivers/remoteproc/Kconfig                    |  19 +
>>  drivers/remoteproc/Makefile                   |   1 +
>>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
>>  include/linux/remoteproc.h                    |   2 +
>>  10 files changed, 723 insertions(+), 5 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
>>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
>>
>>
>> base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> 

