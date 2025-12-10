Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F8A2727E0
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765335095; cv=none; b=ay/bKF4sYH0Ko8j/kUzOZelP1VWNKKvwBp0leKz53Svv0ufK7zj0SSP+sCW/whk/KD6fUBsxJLMFF5zBkB6XRJu/o87wGfQiLha7zQEtGaYkGoxdavjnpG5L4NVhaY4y/pdDn69ikWO19Qj3QHaR6EGcjW7DB9ZYy94ghjbFCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765335095; c=relaxed/simple;
	bh=YOHfrlWqz0vFc79BUNtb/GdkMDfkfYRoG0d0jNrNTOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzHMaIM3zuqZ27d+RR3lYbNY8qqZv0VrNE3WwryaAyomqVh00RVDWd8baHbgyHGBxZW4XR63h+AYUS7PdCKYAcmN3A+HmcPtqlJ4CfgrfF4d8sFxFOatMM1S0Rq19JSWkMlzfc6u3l/qlUBXURnxlk1aYIIPS4oV3I5M0zptGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAMH0J53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHxT5Jzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAMH0J53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHxT5Jzk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA2XwvZ583291
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 02:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1GuKDqUUahGtj/I8DK73iSM3gVLF4U3Qf2IUK/TCnA=; b=oAMH0J53ZjwTmf04
	cIz7xClrYFew1KRVbbjDmzPCvYcHXkCkC51rd8XwDA+s55GsDvJFxWP/WwN8x6wd
	GaupeNwY5TUAEPlTcCX1rMQF0bGNsrAbrJMfib7QjhYrCol3HVMRma/eL8DiUsx1
	MAPx7+ZqGtUW5Eq+hD7VhVomAChX3AO1fV4E508VxdK+oDrfwnR4BKx34Hf53TAc
	e3mFsXkpDjHUXt2jEUsdESrWjcOqaCagExpVmQgsV2KkjH+Oc53xDqVr2aFOWFHr
	Rytfx67tXn2iglYXfQm02Sac+QgY81MFDngOsqhNPVYqrGUadCszn/FxKByhg9+W
	CzIG4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf0mv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 02:51:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982b47ce35so93086155ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 18:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765335091; x=1765939891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1GuKDqUUahGtj/I8DK73iSM3gVLF4U3Qf2IUK/TCnA=;
        b=YHxT5JzkivPJnUBMKnY5VvKKMCpCefyc5yyPyfrHwrinIxVhjponqMyAgWKQiG1Dxh
         EFu9MCaItRVpc+znN6PxKY6+rrMdnL/w9khcr9dAwWPX1cah56vP/vZYkVRNwy9kt8tM
         ckxzlE7QQpVi/kf2X0RACPYYeCJWZRkuVMst0+LvPySn5Aj6c8bKmQ3pUQcytWR93YuW
         aXqLIvfA1VYr22ENcRbh5f9MTj7Rfb2MMFf/uCu0I5ovUiYdlrmZ4l/nHb9UhaGIajzO
         ZbB3dno+c7nYB1yZ7Pe7WPYO8rkHMh8lUeew98kVd2iotj8B9TZJdnaNZih54gbwCn4S
         LBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765335091; x=1765939891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1GuKDqUUahGtj/I8DK73iSM3gVLF4U3Qf2IUK/TCnA=;
        b=Oqj10S9TxfFs+5U/Lje9WiwY/9mp9G1BwR77PYUEEk0k7HmmrznM3zpx6LhL7w+9xx
         0cPnWUbTMfs4cib9UnvD9EUffeHAXj2/950+cCZfxQbHZnK+dvq36/XMAfjsZNyEeRNq
         RfXWHRb0boXuX+gmXNYSOs0907F3/F3KbVNrRV3Zjy8Wq9rveWvOgfIA3cREnaEjzAWQ
         GbeH3tj3fcMuD3t7D9MXHbLFp66kf5e+swBNLx0zdCC8wgcYaz+5u4uRtRWwUeocE05y
         5MN59L6r3fnl1DvG55FT7ZcfjcE7pWGLFqy2YGs21C9YdvSx0TO+wBl43ie5aiWDVNhv
         qdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhcP5oB59maV+E3JZqxbvZb6jVWu/Z6sKpk3s3glji0nDsGxwp5h2vo+PABZv75D0tfTDn4+mVwOFEpE9NF35T@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBAjNhZfRKHDWrrv6mzw2F4U/knLvdXwiMjNift9HPYSHgbjl
	0QOfNKjSfN5AhEghsBFHUj4jbT2+vL1lYjFGvkgptt7TD+WqEFrgqS6YVoAYQEwVRGd4qeP6f3E
	RKH2uHDcT9VrhEn89ipmW1MJKsoo/b20BK7wDc1CctWiiMNNAN1Szt5pfJhptSrxuo/fN/xp7Ol
	pr5Rup
X-Gm-Gg: ASbGnctlze7ByfY5n7c+DhctvNRbvjDgwaNPVzBJfABygcdf9X8UMstf0cjiGH6Dgmu
	1TWexcfZ/lNnIlR+DApgPxya3p/gTd4IwTYhxQ9mooZtrfTmWGT5HyqJRp77Eh40oAX9YnT3USr
	usTuhVlTgN6TwGQPxVPqscFRb3lrmvG+gzPF8m+Ouz4aCdf6sBkDOisDtk46svo46ronl4Qj8LZ
	yuaPxlVERiCk3rjgLGYUCAdiIOod9D78gwrVrOVLWXnL5zvHVFJcI+V3KLfrSKuNol7aHpfWxEK
	pqmnzIHiX4gw9xyto3zw8AlhmWvxW+C61xTokB4phH+ghKT6NOaSKCK+qSbyY+oIuSgb5gllxVO
	+U/LT8e2nJHU1aLGR7W4hK27obQJ//aYnQctVE1QMOduB1u7DBBdzTqCPfGgcLCQ3TB0QfSAqW3
	9QLg2ZzQ==
X-Received: by 2002:a05:6a20:12d0:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-366e0ff5319mr822386637.12.1765335090677;
        Tue, 09 Dec 2025 18:51:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv3kNM2HkB2KeUqMpZ2Tj+oAOSOqt6gNWJQLwGu/+a+DyRV/VvG9gXr6z15IvxgTtRP7dvpg==
X-Received: by 2002:a05:6a20:12d0:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-366e0ff5319mr822372637.12.1765335090199;
        Tue, 09 Dec 2025 18:51:30 -0800 (PST)
Received: from [10.133.33.136] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a32deff0sm16275733a12.34.2025.12.09.18.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 18:51:29 -0800 (PST)
Message-ID: <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:51:25 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Stefan Roese <stefan.roese@mailbox.org>, tanmay.shah@amd.com,
        linux-remoteproc@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O1NhjifiArZiZxtx5lsx49Cu7D5UAbcg
X-Proofpoint-ORIG-GUID: O1NhjifiArZiZxtx5lsx49Cu7D5UAbcg
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=6938e034 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=zd2uoN0lAAAA:8 a=KKAkSRfTAAAA:8
 a=BKyIsoXyv0I8lWNehM4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAyMyBTYWx0ZWRfXwwSs5cCfcYz/
 mFg0FluqAzUEDPCRenHRRq59es5BzcQ+7LX6jS+00n/GBIr26ZI4dxM9Y66vm/Ha+ei2wkNQ3x3
 bhXAfsbCQjN092Q4/7kme7euL+QcmtL9SQCQgy3J2tXYf1clBC9xPkZR193A8bafj7kbpiVKkpi
 jtpuPRq4HVtD0LRtvyIsXawu4vzVKowG3PYN2w17YIbnmkMc2cE0s0cSMrJmRdaNFdULDb0L4XC
 6pLvTv6WfxM4xlAyKvLWyQifkWOTxQ30Qf+1EBvAynp9ZyS4M78BWw/myNi+uMflVkhve/hmgVy
 Ki5osRPkPLB0f33tBk6YhTVVtOtTgO4HDejoc2pYtCQ2Sdvl/mh+fDe3qVWcXh2bf6Oq3Fpn3S6
 KIpKmCnCg5YkX5heDjt7LqDGJsv1iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100023

On 12/5/2025 8:06 PM, Stefan Roese wrote:
> Hi Tanmay,
> 
> On 12/4/25 17:45, Tanmay Shah wrote:
>> Hello,
>>
>> Thank You for your patch. Please find my comments below.
>>
>> On 12/4/25 4:40 AM, Stefan Roese wrote:
>>> Testing on our ZynqMP platform has shown, that some R5 messages might
>>> get dropped under high CPU load. This patch creates a new high-prio
>>
>> Here, I would like to understand what it means by "R5 messages might 
>> get dropped"
>>
>> Even under high CPU load, the messages from R5 are stored in the 
>> virtqueues. If Linux doesn't read it, then it is not really lost/dropped.
>>
>> Could you please explain your use case in detail and how the testing 
>> is conducted?
> 
> Our use-case is, that we send ~4k messages per second from the R5 to
> Linux - sometimes even a bit more. Normally these messages are received
> okay and no messages are dropped. Sometimes, under "high CPU load"
> scenarios it happens, that the R5 has to drop messages, as there is no
> free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
> from the Linux driver not emptying the RX queue.
> 
> Could you please elaborate on these virtqueues a bit? Especially why no
> messages drop should happen because of these virtqueues?

AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
message has been successfully enqueued. The observed "drop" here appears
to be on the R5 side, where the application discards messages when no
entry buffer is available.

In the long run, while improving the Linux side is recommended, it could
also be helpful for the R5 side to implement strategies such as an
application-level buffer and retry mechanisms.


> 
> Thanks,
> Stefan
> 
>> Thanks,
>> Tanmay
>>
>>> workqueue which is now used instead of the default system workqueue.
>>> With this change we don't experience these message drops any more.
>>>
>>> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
>>> Cc: Tanmay Shah <tanmay.shah@amd.com>
>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>> v3:
>>> - Call cancel_work_sync() before freeing ipi (suggested by Zhongqiu Han)
>>>
>>> v2:
>>> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() 
>>> (suggested by Zhongqiu Han)
>>> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
>>>
>>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/ 
>>> remoteproc/xlnx_r5_remoteproc.c
>>> index feca6de68da28..308328b0b489f 100644
>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> @@ -16,6 +16,7 @@
>>>   #include <linux/of_reserved_mem.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/remoteproc.h>
>>> +#include <linux/workqueue.h>
>>>   #include "remoteproc_internal.h"
>>> @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
>>>       enum  zynqmp_r5_cluster_mode mode;
>>>       int core_count;
>>>       struct zynqmp_r5_core **r5_cores;
>>> +    struct workqueue_struct *workqueue;
>>>   };
>>>   /**
>>> @@ -174,10 +176,18 @@ static void handle_event_notified(struct 
>>> work_struct *work)
>>>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>   {
>>>       struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>> +    struct zynqmp_r5_cluster *cluster;
>>>       struct mbox_info *ipi;
>>> +    struct device *dev;
>>>       size_t len;
>>>       ipi = container_of(cl, struct mbox_info, mbox_cl);
>>> +    dev = ipi->r5_core->dev;
>>> +    cluster = dev_get_drvdata(dev->parent);
>>> +    if (!cluster) {
>>> +        dev_err(dev->parent, "Invalid driver data\n");
>>> +        return;
>>> +    }
>>>       /* copy data from ipi buffer to r5_core */
>>>       ipi_msg = (struct zynqmp_ipi_message *)msg;
>>> @@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client 
>>> *cl, void *msg)
>>>       if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>>           dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>>> -    schedule_work(&ipi->mbox_work);
>>> +    queue_work(cluster->workqueue, &ipi->mbox_work);
>>>   }
>>>   /**
>>> @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>       for (i = 0; i < cluster->core_count; i++) {
>>>           r5_core = cluster->r5_cores[i];
>>> +        cancel_work_sync(&r5_core->ipi->mbox_work);
>>>           zynqmp_r5_free_mbox(r5_core->ipi);
>>>           of_reserved_mem_device_release(r5_core->dev);
>>>           put_device(r5_core->dev);
>>> @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>       }
>>>       kfree(cluster->r5_cores);
>>> +    destroy_workqueue(cluster->workqueue);
>>>       kfree(cluster);
>>>       platform_set_drvdata(pdev, NULL);
>>>   }
>>> @@ -1194,11 +1206,20 @@ static int zynqmp_r5_remoteproc_probe(struct 
>>> platform_device *pdev)
>>>           return ret;
>>>       }
>>> +    cluster->workqueue = alloc_workqueue(dev_name(dev),
>>> +                         WQ_UNBOUND | WQ_HIGHPRI, 0);
>>> +    if (!cluster->workqueue) {
>>> +        dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
>>> +        kfree(cluster);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>>       /* wire in so each core can be cleaned up at driver remove */
>>>       platform_set_drvdata(pdev, cluster);
>>>       ret = zynqmp_r5_cluster_init(cluster);
>>>       if (ret) {
>>> +        destroy_workqueue(cluster->workqueue);
>>>           kfree(cluster);
>>>           platform_set_drvdata(pdev, NULL);
>>>           dev_err_probe(dev, ret, "Invalid r5f subsystem device 
>>> tree\n");
>>
> 


-- 
Thx and BRs,
Zhongqiu Han
