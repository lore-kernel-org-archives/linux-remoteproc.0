Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 3 Jan 2018 12:19:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/4] remoteproc: Rename "load_rsc_table" to "parse_fw"
Message-ID: <20180103201940.GI12655@minitux>
References: <20171226203832.14928-1-bjorn.andersson@linaro.org>
 <20171226203832.14928-3-bjorn.andersson@linaro.org>
 <283cde2ddefd472eaeaa66f326df1283@SFHDAG7NODE2.st.com>
 <c9204e2d67ce40a0a218fd679e5370a0@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9204e2d67ce40a0a218fd679e5370a0@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Jan 05:15 PST 2018, Loic PALLARDY wrote:
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> > owner@vger.kernel.org] On Behalf Of Loic PALLARDY
> > Sent: Wednesday, January 03, 2018 11:27 AM
> > To: Bjorn Andersson <bjorn.andersson@linaro.org>; Ohad Ben-Cohen
> > <ohad@wizery.com>
> > Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > arm-msm@vger.kernel.org; linux-soc@vger.kernel.org; Suman Anna <s-
> > anna@ti.com>; Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> > Subject: RE: [PATCH v2 2/4] remoteproc: Rename "load_rsc_table" to
> > "parse_fw"
> > > -----Original Message-----
> > > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-
> > remoteproc-
> > > owner@vger.kernel.org] On Behalf Of Bjorn Andersson
[..]
> > > -	/* load resource table */
> > > -	ret = rproc_load_rsc_table(rproc, fw);
> > > +	/* parse firmware resources */
> > > +	ret = rproc_parse_fw(rproc, fw);
> > Hi Bjorn,
> > 
> > I think it will be good to keep resource (aka rsc) in function name. only
> > "parse_fw" is not enough explicit and we don't know why rproc should parse
> > firmware.
> > 
> > Regards,
> > Loic
> Forgot my previous remark, better understanding thanks to the rest of
> the series.
> Anyway, will be nice to have a comment here as it is not only parsing
> the firmware, you collect some information like copy of the resource
> table, list of elf segment to dump...
> I think it is important to be clear about resource table management as
> it is a key element of the remoteproc core, where it is loaded, where
> it is copied back in memory...

I didn't manage to come up with a better name, but adding a comment to
capture this makes a lot of sense. I will respin this patch!

Thanks for reviewing this!

Regards,
Bjorn
