Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:32176 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753153AbcKCNPO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Nov 2016 09:15:14 -0400
From: "Koul, Vinod" <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: st_fdma: Update st_fdma to 'depends on
 REMOTEPROC'.
Date: Thu, 3 Nov 2016 13:15:09 +0000
Message-ID: <1478178908.6505.28.camel@intel.com>
References: <1477039465-31121-1-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1477039465-31121-1-git-send-email-peter.griffin@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-7"
Content-ID: <16DC56BA99DEA947BD6907CA45B10C6B@intel.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>, "kernel@stlinux.com" <kernel@stlinux.com>, "arnd@arndb.de" <arnd@arndb.de>, "peter.griffin@linaro.org" <peter.griffin@linaro.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 2016-10-21 at 09:44 +-0100, Peter Griffin wrote:
+AD4- During randconfig builds you can get the following warning
+AD4- +ACI-warning: (ST+AF8-FDMA) selects ST+AF8-SLIM+AF8-REMOTEPROC which has unmet direct
+AD4- +AKA-dependencies (REMOTEPROC)+ACI-
+AD4- 
+AD4- randconfig builds should always build without any warnings so
+AD4- update fdma to depend on REMOTEPROC so this can not happen.

Applied, thanks

-- 
+AH4-Vinod
