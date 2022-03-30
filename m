Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FA4C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 10:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245269AbiC3KND (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Mar 2022 06:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245244AbiC3KM6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Mar 2022 06:12:58 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421215E88A
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Mar 2022 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648635073; x=1680171073;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=yssneFuZTsGQ13NTSA00ZRlJPnbuj6TUfsK3+0SYr7Y=;
  b=mzHitm2Fii2CUb14w01CaO6+YW+dRMnlxOm9xnjWk+LsFqoAWzmq7//m
   F9H6H9doEQsyQquNLvvZPxy23Ncx/YCN1OE3iif/TwG+obHD4kfOkzp3/
   Ke996o/WMuYHasZsvUjG2uKC1WUQemvs8ButK913b3UES9pY2npkfqroz
   s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Mar 2022 03:11:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 03:11:12 -0700
Received: from [10.110.1.142] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 30 Mar
 2022 03:11:10 -0700
Message-ID: <0410ceda-cbdd-43a9-7d9b-4079bcdb6237@quicinc.com>
Date:   Wed, 30 Mar 2022 15:41:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-remoteproc@vger.kernel.org>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Possible case of Race in kobject_get_path()
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

We are facing one issue where one driver (p1) is trying to register its 
device from driver probe
and from another path (p2) dev_set_name(new name) done from driver probe 
of the added device whose
new name length can be more than earlier done in (p1 path) which could 
result in redzone overwritten issue.

Can we get your suggestion here ? is this case of a race here ?

             p1                                                   p2

  device_register()
     kobject_get_path()
             =>  get_kobj_path_length
             (length is calculated from this path)

                                                  dev_set_name()

             => fill_kobj_path
               (path is copied here)


Thanks,
-Mukesh

