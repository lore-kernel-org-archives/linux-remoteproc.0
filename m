Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 8 Sep 2016 12:00:40 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 13/19] remoteproc: core: Append resource only if spare
 resource present
Message-ID: <20160908110040.GP4921@dell>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-14-git-send-email-loic.pallardy@st.com>
 <20160908093313.GM4921@dell>
 <41548132-246a-f6d0-473d-e2ab72a86e15@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41548132-246a-f6d0-473d-e2ab72a86e15@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 08 Sep 2016, loic pallardy wrote:

> 
> 
> On 09/08/2016 11:33 AM, Lee Jones wrote:
> > On Wed, 31 Aug 2016, Loic Pallardy wrote:
> > 
> > > This patch renames rproc_add_resource_table_entry in __add_rsc_tbl_entry
> > > to have shorter function name and adds spare resource support.
> > > To guarantee remoteproc won't overwrite firmware data when copying
> > > back modified resource table, __add_rsc_tbl_entry verifies first that
> > > resource table owns a spare resource and uses spare bytes to create
> > > a new resource entry. Spare resource is updated according to changes.
> > > 
> > > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 54 ++++++++++++++++++++----------------
> > >  1 file changed, 30 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index aff1a00..25a429b 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1107,39 +1107,34 @@ static int __update_rsc_tbl_entry(struct rproc *rproc,
> > >  	return !updated;
> > >  }

[...]

> > > +	spare.len = __get_rsc_tbl_spare_size(rproc, table, tablesz, &spare_index);
> > > +	if (spare.len < (sizeof(h) + request->size + 4)) /* new offset entry */
> > > +		return -EPERM;
> > 
> > What does this have to do with permissions?
> Yes sure, I'll replaced by -EINVAL as resource too large compare to spare
> area capability.

Yes, or perhaps -ENOSPC?

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
