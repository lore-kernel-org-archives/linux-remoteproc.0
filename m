Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv7 00/15] remoteproc: updates for omap remoteproc support
Date: Fri, 21 Feb 2020 12:19:21 +0200
Message-ID: <20200221101936.16833-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com
Cc: linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, linux-omap@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

Sorry for one more spin... Hopefully this is the final revision of the
series though.

Anyways, this version just contains one bigger change (patch #12),
and then a number of minor cosmetic fixes only (patch #1-#3, #5, #10,
#11, #14), and one new patch (#15).

Patch #12 has the most extensive modifications to warp around the runtime
PM support to the shape Suman wanted it. Rest of the cosmetic changes are
pretty much originated from Suman also (we synced offline that this version
of the series should be fine and contains all the changes he also wanted still
in.) In addition to this, patch #15 was added for switching the omap
remoteproc header to SPDX license identifier.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
